from typing import Literal

from pydantic import BaseModel, confloat


class TBQLabelScore(BaseModel):
    step_1_thinking: str
    step_2_true_score: float
    step_3_false_score: float
    step_4_maybe_score: float # Literal[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    step_5_confidence: float

class TBQLabelScore_only_score(BaseModel):
    step_2_true_score: float
    step_3_false_score: float
    step_4_maybe_score: float  # Literal[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    step_5_confidence: float


class CheckRuleUsage(BaseModel):
    step_1_score: float