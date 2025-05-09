import os
import importlib
import inspect
from pathlib import Path

# Assuming 'Strategy' is the base class in 'src/strategy/base.py'
from src.strategy.base import Strategy

# Global cache for strategy classes
_strategy_classes_cache = None


def load_strategy_classes():
    global _strategy_classes_cache
    # If the cache is not empty, return it directly
    if _strategy_classes_cache is not None:
        return _strategy_classes_cache

    strategy_classes = {}
    # Define the path of the 'src/strategy' directory
    strategy_dir = Path(__file__).parent

    # Iterate through each Python file in the strategy directory
    for file in strategy_dir.glob('*.py'):
        if file.name == '__init__.py':
            continue

        # Import the module dynamically
        module_name = f'src.strategy.{file.stem}'
        module = importlib.import_module(module_name)

        # Iterate through members of the module to find subclasses of Strategy
        for name, obj in inspect.getmembers(module, inspect.isclass):
            # Check if it's a subclass of Strategy and not the Strategy class itself
            if issubclass(obj, Strategy) and obj is not Strategy:
                strategy_classes[name] = obj

    # Cache the result for future calls
    _strategy_classes_cache = strategy_classes
    return strategy_classes


# Function to get a strategy class by its class name
def get_strategy_class(class_name):
    strategies = load_strategy_classes()
    return strategies.get(class_name)


# Example usage
if __name__ == "__main__":
    # Load all strategy classes (uses cache if called again)
    strategies = load_strategy_classes()
    print(strategies)

    # Get a specific strategy class by name
    class_name = "ThinkAndCheckStepByStep"  # Example class name
    strategy_class = get_strategy_class(class_name)

    if strategy_class:
        print(f"Strategy class '{class_name}' found: {strategy_class}")
    else:
        print(f"Strategy class '{class_name}' not found.")
