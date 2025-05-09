from typing import Literal

from pydantic import BaseModel, constr


class SelectCheckReason(BaseModel):
    step_1_thinking: str
    step_2_selected_rule: str
    step_3_selected_facts: list[str]
    step_4_conclusion_if_all_condition_support: str
    step_5_judgement_of_conclusion: Literal[
        "The conditions of the select rule are all held by selected facts, so the conclusion can be derived.", "The conditions of the select rule are not all held by selected facts, so the conclusion cannot be derived."]


class CheckRuleUsage(BaseModel):
    step_1_thinking: str
    step_2_correctness_of_judgement_for_conclusion: Literal["The conclusion is correct.", "The conclusion is incorrect."]
    step_3_final_conclusion: str

class CheckFinish(BaseModel):
    step_1_judge_finish: Literal["The label can be predicted by the reasoning paths.", "The label can not be predicted by the reasoning paths."]
    step_2_label: Literal["True", "False", "Maybe"]