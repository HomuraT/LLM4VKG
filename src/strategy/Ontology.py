from datetime import datetime

from rich.console import Console
from rich.panel import Panel
from tqdm import tqdm

from src.llm.utils.answer_format.utils import DynamicModelBuilder
from src.llm.utils.langchain_utils import Modules
from src.strategy.base import Strategy
from src.utils.rag import SentenceSimilarity
from src.utils.tools import create_literal_from_list
from src.vkg_utils.ontology_mapping_utils import OntologyAndMapping


class OntologyOptimization(Strategy):
    def __init__(self, modules: Modules, **kwargs):
        super().__init__(modules)
        self.name = "OntologyOptimization"
        self.console = Console()
        self.args = kwargs

        self.logMsg = False
        if "logMsg" in self.args:
            self.logMsg = self.args["logMsg"]

        self.printMsg = True
        if "printMsg" in self.args:
            self.printMsg = self.args["printMsg"]


        self.oam:OntologyAndMapping = None
        self.prefix_predefined = {}
        self.rag_model = SentenceSimilarity()

    def _log_and_print(self, msg):
        if self.printMsg:
            self.console.print(
                Panel(
                    msg + f"\n\n[bold green]Time[/bold green]: [black]{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}[/black]",
                    title="[bold dark_blue]Msg Box[/bold dark_blue]",
                    border_style="blue",
                    style="black",
                    subtitle="[italic grey39]LLM for R2RML[/italic grey39]",
                    subtitle_align="right"
                )
            )

    def _progress_bar(self, obj, desc="Processing..."):
        if self.printMsg:
            return tqdm(
                obj,
                desc=desc,                  # 描述
                total=len(obj),             # 总数
                ncols=80,                   # 设置进度条宽度（动态适应控制台）
                bar_format="{desc}: |{bar}| {percentage:3.0f}% ({n_fmt}/{total_fmt}) [{rate_fmt}, {remaining} left, {elapsed} elapsed]",
                colour="cyan",              # 设置进度条颜色
                unit=" its",              # 设置单位
            )
        else:
            return obj

    def search_prefix(self):
        # self._log_and_print("Start to search prefix for network...")
        # for prefix_name, prefix_obj in self._progress_bar(self.oam.prefixes.prefixes.items()):
        #     # 使用超时机制
        #     prefix_predefined = run_with_timeout(PrefixOntologyParser.from_prefix, 10, prefix_obj)
        #
        #     # 如果超时或没有返回结果，设置为 None
        #     if prefix_predefined is None:
        #         prefix_predefined = None
        #
        #     self.prefix_redefined[prefix_name] = prefix_predefined.to_dict() if prefix_predefined else None
        #
        # self._log_and_print("Finish to search prefix for network...")

        self.prefix_predefined = {'bsbm1': None, 'rdfs': {'classes': {'Class', 'Container', 'Resource', 'Datatype', 'Literal', 'ContainerMembershipProperty'}, 'object_properties': {'isDefinedBy', 'member', 'comment', 'seeAlso', 'label'}, 'data_properties': set()}, 'rdf': {'classes': {'Alt', 'Property', 'List', 'Bag', 'CompoundLiteral', 'Statement', 'Seq'}, 'object_properties': {'object', 'type', 'subject', 'value', 'first', 'predicate'}, 'data_properties': set()}, 'owl': {'classes': {'DeprecatedClass', 'AllDisjointProperties', 'Ontology', 'Thing', 'DatatypeProperty', 'AsymmetricProperty', 'FunctionalProperty', 'DeprecatedProperty', 'NegativePropertyAssertion', 'Axiom', 'AllDifferent', 'ObjectProperty', 'TransitiveProperty', 'InverseFunctionalProperty', 'NamedIndividual', 'AnnotationProperty', 'Nothing', 'AllDisjointClasses', 'ReflexiveProperty', 'OntologyProperty', 'IrreflexiveProperty', 'SymmetricProperty', 'Restriction', 'Class', 'DataRange', 'Annotation'}, 'object_properties': {'bottomObjectProperty', 'disjointUnionOf', 'hasValue', 'hasKey', 'members', 'disjointWith', 'onClass', 'hasSelf', 'complementOf', 'annotatedProperty', 'annotatedSource', 'annotatedTarget', 'topObjectProperty'}, 'data_properties': {'bottomDataProperty', 'withRestrictions', 'datatypeComplementOf', 'onDataRange', 'onDatatype', 'topDataProperty'}}, 'dc': None, 'foaf': {'classes': {'Project', 'OnlineEcommerceAccount', 'LabelProperty', 'OnlineChatAccount', 'Image', 'Organization', 'OnlineGamingAccount', 'Document', 'OnlineAccount', 'Person', 'PersonalProfileDocument', 'Group', 'Agent'}, 'object_properties': {'depicts', 'pastProject', 'phone', 'accountServiceHomepage', 'based_near', 'knows', 'depiction', 'interest', 'publications', 'made', 'fundedBy', 'homepage', 'page', 'mbox', 'theme', 'thumbnail', 'primaryTopic', 'currentProject', 'account', 'img', 'schoolHomepage', 'focus', 'maker', 'openid', 'tipjar', 'workInfoHomepage', 'logo', 'topic', 'holdsAccount', 'member', 'workplaceHomepage', 'weblog', 'topic_interest'}, 'data_properties': {'sha1', 'age', 'givenname', 'nick', 'msnChatID', 'dnaChecksum', 'family_name', 'icqChatID', 'surname', 'plan', 'givenName', 'title', 'firstName', 'status', 'myersBriggs', 'yahooChatID', 'jabberID', 'lastName', 'accountName', 'familyName', 'gender', 'skypeID', 'birthday', 'aimChatID', 'name', 'geekcode', 'mbox_sha1sum'}}, 'schema': None, 'prov': {'classes': {'Association', 'SoftwareAgent', 'Create', 'End', 'Insertion', 'Usage', 'Influence', 'Organization', 'Publish', 'EmptyDictionary', 'InstantaneousEvent', 'n1e31a8ba0ac64e35b3822110ceb85257b19', 'Removal', 'Quotation', 'Collection', 'RightsAssignment', 'Replace', 'Generation', 'KeyEntityPair', 'Copyright', 'Creator', 'n1e31a8ba0ac64e35b3822110ceb85257b35', 'Invalidation', 'Location', 'DirectQueryService', 'Modify', 'n1e31a8ba0ac64e35b3822110ceb85257b39', 'Delegation', 'Accept', 'Dictionary', 'Contributor', 'Revision', 'Bundle', 'Publisher', 'n1e31a8ba0ac64e35b3822110ceb85257b16', 'ServiceDescription', 'AgentInfluence', 'Plan', 'n1e31a8ba0ac64e35b3822110ceb85257b4', 'Contribute', 'PrimarySource', 'n1e31a8ba0ac64e35b3822110ceb85257b58', 'EntityInfluence', 'http://www.w3.org/2002/07/owl#Thing', 'RightsHolder', 'Person', 'Activity', 'Communication', 'EmptyCollection', 'ActivityInfluence', 'Derivation', 'Attribution', 'Entity', 'Submit', 'n1e31a8ba0ac64e35b3822110ceb85257b9', 'Start', 'n1e31a8ba0ac64e35b3822110ceb85257b63', 'Role', 'Agent'}, 'object_properties': {'qualifiedAssociation', 'wasQuotedFrom', 'hadPrimarySource', 'hadMember', 'hadRole', 'has_anchor', 'wasEndedBy', 'agent', 'entity', 'has_query_service', 'wasAssociatedWith', 'wasInfluencedBy', 'wasStartedBy', 'qualifiedInsertion', 'dictionary', 'atLocation', 'http://www.w3.org/2002/07/owl#topObjectProperty', 'qualifiedAttribution', 'influenced', 'qualifiedDelegation', 'qualifiedEnd', 'qualifiedGeneration', 'qualifiedRevision', 'wasRevisionOf', 'hadActivity', 'alternateOf', 'generated', 'wasInvalidatedBy', 'pingback', 'derivedByInsertionFrom', 'hadDictionaryMember', 'asInBundle', 'used', 'wasDerivedFrom', 'invalidated', 'qualifiedPrimarySource', 'influencer', 'hadPlan', 'hadGeneration', 'hadUsage', 'describesService', 'has_provenance', 'qualifiedRemoval', 'qualifiedCommunication', 'activity', 'mentionOf', 'qualifiedStart', 'specializationOf', 'pairEntity', 'actedOnBehalfOf', 'wasAttributedTo', 'qualifiedInfluence', 'qualifiedQuotation', 'wasInformedBy', 'qualifiedUsage', 'insertedKeyEntityPair', 'derivedByRemovalFrom', 'qualifiedInvalidation', 'wasGeneratedBy', 'qualifiedDerivation'}, 'data_properties': {'pairKey', 'invalidatedAtTime', 'atTime', 'provenanceUriTemplate', 'value', 'endedAtTime', 'startedAtTime', 'removedKey', 'generatedAtTime'}}, 'gr': None, 'dcterms': None, 'bsbm1-inst': None, 'gr-inst': None, 'foaf-inst': {'classes': {'http://xmlns.com/foaf/0.1/Image', 'http://xmlns.com/foaf/0.1/OnlineEcommerceAccount', 'http://xmlns.com/foaf/0.1/LabelProperty', 'http://xmlns.com/foaf/0.1/OnlineAccount', 'http://xmlns.com/foaf/0.1/Organization', 'http://xmlns.com/foaf/0.1/Agent', 'http://xmlns.com/foaf/0.1/Project', 'http://xmlns.com/foaf/0.1/Group', 'http://xmlns.com/foaf/0.1/OnlineGamingAccount', 'http://xmlns.com/foaf/0.1/Person', 'http://xmlns.com/foaf/0.1/Document', 'http://xmlns.com/foaf/0.1/OnlineChatAccount', 'http://xmlns.com/foaf/0.1/PersonalProfileDocument'}, 'object_properties': {'http://xmlns.com/foaf/0.1/knows', 'http://xmlns.com/foaf/0.1/focus', 'http://xmlns.com/foaf/0.1/mbox', 'http://xmlns.com/foaf/0.1/maker', 'http://xmlns.com/foaf/0.1/member', 'http://xmlns.com/foaf/0.1/weblog', 'http://xmlns.com/foaf/0.1/accountServiceHomepage', 'http://xmlns.com/foaf/0.1/tipjar', 'http://xmlns.com/foaf/0.1/topic', 'http://xmlns.com/foaf/0.1/publications', 'http://xmlns.com/foaf/0.1/topic_interest', 'http://xmlns.com/foaf/0.1/based_near', 'http://xmlns.com/foaf/0.1/primaryTopic', 'http://xmlns.com/foaf/0.1/img', 'http://xmlns.com/foaf/0.1/phone', 'http://xmlns.com/foaf/0.1/homepage', 'http://xmlns.com/foaf/0.1/pastProject', 'http://xmlns.com/foaf/0.1/workInfoHomepage', 'http://xmlns.com/foaf/0.1/made', 'http://xmlns.com/foaf/0.1/depiction', 'http://xmlns.com/foaf/0.1/schoolHomepage', 'http://xmlns.com/foaf/0.1/holdsAccount', 'http://xmlns.com/foaf/0.1/logo', 'http://xmlns.com/foaf/0.1/depicts', 'http://xmlns.com/foaf/0.1/interest', 'http://xmlns.com/foaf/0.1/workplaceHomepage', 'http://xmlns.com/foaf/0.1/currentProject', 'http://xmlns.com/foaf/0.1/theme', 'http://xmlns.com/foaf/0.1/page', 'http://xmlns.com/foaf/0.1/thumbnail', 'http://xmlns.com/foaf/0.1/openid', 'http://xmlns.com/foaf/0.1/account', 'http://xmlns.com/foaf/0.1/fundedBy'}, 'data_properties': {'http://xmlns.com/foaf/0.1/plan', 'http://xmlns.com/foaf/0.1/icqChatID', 'http://xmlns.com/foaf/0.1/nick', 'http://xmlns.com/foaf/0.1/birthday', 'http://xmlns.com/foaf/0.1/skypeID', 'http://xmlns.com/foaf/0.1/geekcode', 'http://xmlns.com/foaf/0.1/sha1', 'http://xmlns.com/foaf/0.1/givenname', 'http://xmlns.com/foaf/0.1/jabberID', 'http://xmlns.com/foaf/0.1/status', 'http://xmlns.com/foaf/0.1/familyName', 'http://xmlns.com/foaf/0.1/lastName', 'http://xmlns.com/foaf/0.1/title', 'http://xmlns.com/foaf/0.1/age', 'http://xmlns.com/foaf/0.1/accountName', 'http://xmlns.com/foaf/0.1/family_name', 'http://xmlns.com/foaf/0.1/surname', 'http://xmlns.com/foaf/0.1/dnaChecksum', 'http://xmlns.com/foaf/0.1/givenName', 'http://xmlns.com/foaf/0.1/yahooChatID', 'http://xmlns.com/foaf/0.1/gender', 'http://xmlns.com/foaf/0.1/myersBriggs', 'http://xmlns.com/foaf/0.1/firstName', 'http://xmlns.com/foaf/0.1/mbox_sha1sum', 'http://xmlns.com/foaf/0.1/aimChatID', 'http://xmlns.com/foaf/0.1/name', 'http://xmlns.com/foaf/0.1/msnChatID'}}, 'schema-inst': None}

    def prefix_declaration_check_and_refine(self):
        chain_prefix_and_name_change = self._getm_list(
            ["prompt::prefix_and_name_change", "llm::free_talk", "paser::to_json"])
        chain_prefix_and_name_change_recheck = self._getm_list(
            ["prompt::prefix_and_name_change_recheck", "llm::free_talk", "paser::to_json"])

        def check_declarations(declarations, prefix_key, target_key, forbided_prefixes=["owl", "rdf", "rdfs"]):
            """
            检查和处理类或对象属性的声明，根据传入的目标集合进行处理。

            :param declarations: 要处理的声明对象，可以是 class_declarations 或 object_property_declarations。
            :param prefix_key: 用于查找 prefix_predefined 字典中的前缀键名。
            :param target_key: 用于查找 prefix_predefined 中目标集合的键名（'classes' 或 'object_properties'）。
            """
            self._log_and_print(f"Check {target_key.capitalize()}")

            count_changed = 0
            count_to_individual = 0
            changed_log = []

            change_memory = []

            target_set = []
            target2prefix = {}
            for k, v in self.prefix_predefined.items():
                if k in forbided_prefixes:
                    continue

                prefix_predefined = v

                # 如果找不到对应的 prefix，则跳过
                if prefix_predefined is None:
                    continue

                target_set_item = list(prefix_predefined[target_key])
                for item in target_set_item:
                    target2prefix[item] = k

                target_set += target_set_item

            for name, obj in self._progress_bar(declarations.PaNs.items()):

                # 如果对象的名称已经在目标集合中，跳过
                if obj.name in target_set:
                    if target2prefix[obj.name] != prefix_key:
                        obj.prefix = self.oam.prefixes.get(target2prefix[obj.name])
                    continue

                selected_target_set = self.rag_model.find_top_k(obj.name, target_set, 20)
                data = {
                    "current_name": obj.name,
                    "target_name_set": selected_target_set,
                }

                # 动态构建替换模型
                ReplaceModel = DynamicModelBuilder.build(
                    "ReplaceModel",
                    attrs=[
                        ("thinking", str),
                        ("replace", create_literal_from_list(selected_target_set + [None]))
                    ]
                )

                # 设置响应格式为替换模型
                chain_prefix_and_name_change.steps[-2].response_format = ReplaceModel
                result = chain_prefix_and_name_change.invoke(data)

                # 根据替换结果更新对象
                if result["replace"] is None:
                    obj.prefix = self.oam.prefixes.get(list(self.oam.prefixes.prefixes.keys())[0])
                    count_to_individual += 1
                else:
                    changed_log.append(f"{obj.prefix.prefixName}:{obj.name} -> {target2prefix[result['replace']]}:{result['replace']}")
                    change_memory.append((obj, result["replace"]))
                    count_changed += 1

            changed_log_recheck = []
            if count_changed > 0:
                RecheckedModel = DynamicModelBuilder.build(
                    "RecheckedModel",
                    attrs=[(i, bool) for i in changed_log])
                chain_prefix_and_name_change_recheck.steps[-2].response_format = RecheckedModel
                result = chain_prefix_and_name_change_recheck.invoke({"changed_log": changed_log})

                for k, v in result.items():
                    idx = changed_log.index(k)
                    if v:
                        obj, new_name = change_memory[idx]
                        changed_log_recheck.append(f"{obj.prefix.prefixName}:{obj.name}->{obj.prefix.prefixName}:{new_name}")

                        args = obj.__dict__.copy()
                        args['prefix'] = self.oam.prefixes.get(list(self.oam.prefixes.prefixes.keys())[0])
                        new_sub_obj = obj.__class__(**args)
                        obj.reset(name=new_name, prefix=self.oam.prefixes.get(target2prefix[new_name]))
                        new_sub_obj.add_equivalent(obj)

                        declarations.add(new_sub_obj)
                        declarations.add(obj)

            changed_log_recheck = '\n'.join(changed_log_recheck)
            changed_log = '\n'.join(changed_log)
            self._log_and_print(f"{count_changed} are changed and {count_to_individual} are to individual\nChanged log:\n{changed_log}\nChanged log checked:\n{changed_log_recheck}\n")

        # 使用示例：
        # 处理 class_declarations
        check_declarations(self.oam.class_declarations, "prefix", "classes")
        check_declarations(self.oam.object_property_declarations, "prefix", "object_properties")
        check_declarations(self.oam.data_property_declarations, "prefix", "data_properties")
        self.oam.refresh()
        pass

    def run(self, data):
        self.oam = data["oam"]
        self.search_prefix()
        self.prefix_declaration_check_and_refine()

        return True
