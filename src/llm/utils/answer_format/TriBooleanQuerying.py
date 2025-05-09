from typing import Literal

from pydantic import BaseModel

class LabelOfQuery(BaseModel):
    label: Literal['True', 'False', 'Maybe']

class BiLabelOfQuery(BaseModel):
    label: Literal['True', 'False']

class CoTTBQ(BaseModel):
    label: Literal['True', 'False', 'Maybe']
    thinking: list[str]
    class Config:
        fields = {
            'thinking': {'order': 0},
            'label': {'order': 1}
        }


class CoTNaturalLanguageLabel(BaseModel):
    thinking: list[str]
    conclusion: Literal[
        'The query can be derived from the facts and rules.',
        'The negation of the query can be derived from the facts and rules.',
        'Neither the query nor its negation can be derived from the facts and rules.']
    label: Literal['True', 'False', 'Maybe']
