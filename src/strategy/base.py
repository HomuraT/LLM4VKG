from abc import abstractmethod

from src.llm.utils.langchain_utils import Modules


class Strategy:
    def __init__(self, modules: Modules, **kwargs):
        self.modules = modules
        self.name = None

    @abstractmethod
    def run(self, data):
        raise NotImplementedError("Subclass must implement abstract method")


    def _getm(self, mid):
        return self.modules.get_module(mid).copy()

    def _getm_list(self, mids: list):
        chain = self._getm(mids[0])
        for mid in mids[1:]:
            chain = chain | self._getm(mid)
        return chain
