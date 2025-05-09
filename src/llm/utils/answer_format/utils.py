import importlib.util
import inspect
import os
from typing import Any, List, Tuple, Dict, Literal

from pydantic import BaseModel, create_model, validator

import src.llm.utils.answer_format


def get_base_model_classes():
    class_dict = {}
    directory = os.path.dirname(src.llm.utils.answer_format.__file__)  # Get the directory path

    # List all .py files in the directory (excluding __init__.py)
    for filename in os.listdir(directory):
        if filename.endswith(".py") and filename != "__init__.py":
            module_name = filename[:-3]  # Strip the .py from filename to get the module name

            # Construct the full module path
            full_module_name = f"src.llm.utils.answer_format.{module_name}"
            if module_name == 'utils':
                continue

            # Import the module dynamically
            spec = importlib.util.spec_from_file_location(full_module_name, os.path.join(directory, filename))
            module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(module)

            # Inspect the module for classes
            for name, cls in inspect.getmembers(module, inspect.isclass):
                # Check if the class is a subclass of BaseModel and not BaseModel itself
                if issubclass(cls, BaseModel) and cls is not BaseModel:
                    class_dict[name] = cls

    return class_dict


# 调用函数获取类名到类对象的映射
global base_model_classes
base_model_classes = get_base_model_classes()


def get_format_by_name(name):
    global base_model_classes
    if name in base_model_classes:
        return base_model_classes[name]
    else:
        return None


class DynamicModelBuilder:
    @staticmethod
    def build(model_name: str, attrs: List[Tuple[str, Any]], validators: Dict[str, Any] = None):
        """
        Build a Pydantic BaseModel dynamically with a list of attributes and optional validators.

        :param model_name: The name of the model.
        :param attrs: A list of tuples containing attribute name and type.
        :param validators: Optional. A dictionary of validators to add to the model.
        :return: A dynamically created Pydantic model class, subclass of BaseModel.
        """
        # Convert the list of attributes to a dictionary suitable for create_model
        fields = {attr_name: (attr_type, ...) for attr_name, attr_type in attrs}
        # Ensure the model is a subclass of BaseModel
        model = create_model(model_name, __base__=BaseModel, **fields)

        # Add validators if provided
        if validators:
            for validator_name, validator_func in validators.items():
                setattr(model, validator_name, validator(validator_name, pre=True, allow_reuse=True)(validator_func))

        return model


if __name__ == '__main__':
    # Example usage in a single line
    DynamicModel = DynamicModelBuilder.build(
        'DynamicModel',
        [('label', Literal['True', 'False', 'Maybe']), ('value', int)],
        {'check_label': lambda cls, v: v if v in ['True', 'False', 'Maybe'] else ValueError('Invalid label')}
    )

    # Instantiate the model
    try:
        instance = DynamicModel(label='True', value=10)
        print(instance)
        instance = DynamicModel(label='asdsad', value=10)
    except ValueError as e:
        print(e)

    # Rebuilding the model with different attributes in a single line
    UpdatedModel = DynamicModelBuilder.build(
        'UpdatedModel',
        [('label', Literal['Yes', 'No']), ('value', float)]
    )

    # Instantiate the updated model
    try:
        updated_instance = UpdatedModel(label='Yes', value=10.5)
        print("123", updated_instance)
        updated_instance = UpdatedModel(label='asd', value=10.5)

    except ValueError as e:
        print(e)
