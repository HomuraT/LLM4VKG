from rank_bm25 import BM25Okapi
import numpy as np

from sentence_transformers import SentenceTransformer, util
import hashlib


def get_top_n_sentences(query, documents, top_n=50):
    """
    使用 BM25 从文档集合中检索与查询最相关的句子。

    参数:
        query (str): 查询字符串。
        documents (list of str): 文档集合，每个文档为一个句子。
        top_n (int): 返回的最相关句子的数量。

    返回:
        list of tuple: 包含前 top_n 个句子及其 BM25 分数的列表。
    """
    # 文档分词
    tokenized_documents = [doc.split() for doc in documents]

    # 初始化 BM25 模型
    bm25 = BM25Okapi(tokenized_documents)

    # 查询分词
    tokenized_query = query.split()

    # 计算每个文档的相关性得分
    scores = bm25.get_scores(tokenized_query)

    # 获取得分最高的前 top_n 个文档索引
    top_n_indices = np.argsort(scores)[::-1][:top_n]

    # 提取句子和分数
    top_sentences = [(documents[i], scores[i]) for i in top_n_indices]

    return top_sentences


class SentenceSimilarity:
    def __init__(self, model_name='all-MiniLM-L6-v2'):
        """
        初始化类，设置模型名称并准备嵌入缓存。
        :param model_name: SentenceTransformer 模型名称
        """
        self.model_name = model_name
        self.model = None  # 懒加载模型
        self.encoded_cache = {}  # 缓存已编码的句子及其向量

    def _initialize_model(self):
        """
        初始化 SentenceTransformer 模型。
        """
        if self.model is None:
            print(f"Initializing model: {self.model_name}")
            self.model = SentenceTransformer(self.model_name)

    def _get_sentence_hash(self, sentence):
        """
        计算句子的哈希值，用于唯一标识缓存。
        :param sentence: 输入句子
        :return: 哈希值
        """
        return hashlib.md5(sentence.encode('utf-8')).hexdigest()

    def _get_or_encode(self, sentence):
        """
        获取句子的嵌入。如果句子已被编码，则直接从缓存中获取。
        :param sentence: 输入句子
        :return: 句子的嵌入向量
        """
        sentence_hash = self._get_sentence_hash(sentence)
        if sentence_hash in self.encoded_cache:
            return self.encoded_cache[sentence_hash]
        else:
            self._initialize_model()
            embedding = self.model.encode(sentence, convert_to_tensor=True)
            self.encoded_cache[sentence_hash] = embedding
            return embedding

    def find_top_k(self, query, sentences, k=5, with_scores=False):
        """
        查找与查询最相似的前 K 个句子。
        :param query: 查询句子
        :param sentences: 候选句子列表
        :param k: 返回相似度最高的前 K 个句子
        :return: 前 K 个句子及其相似度的列表
        """
        # 获取查询的嵌入
        query_embedding = self._get_or_encode(query)

        # 获取候选句子的嵌入
        sentence_embeddings = [self._get_or_encode(sentence) for sentence in sentences]

        # 计算相似度
        similarities = [util.pytorch_cos_sim(query_embedding, embedding).item() for embedding in sentence_embeddings]

        # 找到前 K 个相似句子及其相似度
        top_k_indices = sorted(range(len(similarities)), key=lambda i: similarities[i], reverse=True)[:k]
        if with_scores:
            top_k_results = [(sentences[i], similarities[i]) for i in top_k_indices]
        else:
            top_k_results = [sentences[i] for i in top_k_indices]

        return top_k_results