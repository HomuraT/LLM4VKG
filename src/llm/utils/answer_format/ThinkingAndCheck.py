from typing import Literal

from pydantic import BaseModel, constr
class SelectAndExecute(BaseModel):
    step_1_thinking: str
    step_2_selected_rule: str
    step_3_selected_facts: list[str]
    step_4_acquired_conclusion: str

class SelectAndExecuteWOthinking(BaseModel):
    thinking: Literal['none']
    selected_rule: constr(max_length=300)
    selected_facts: list[constr(max_length=100)]
    acquired_conclusion: constr(max_length=100)

class JudgeAndReason(BaseModel):
    judge: Literal['The conclusion is correct.', 'The conclusion is wrong.']
    reason: str

class JudgeAndReasonWOReason(BaseModel):
    judge: Literal['The conclusion is correct.', 'The conclusion is wrong.']
    reason: Literal['none']

class JudgeFinish(BaseModel):
    thinking:  str
    judge_finish: Literal['Yes', 'No']
    label: Literal['True', 'False', 'Maybe', 'Can not judge']

class JudgeFinishLimitedLength(BaseModel):
    thinking:  constr(max_length=100)
    judge_finish: Literal['Yes', 'No']
    label: Literal['True', 'False', 'Maybe', 'Can not judge']