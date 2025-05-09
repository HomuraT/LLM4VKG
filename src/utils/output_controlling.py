class JSONPredictor:
    def __init__(self):
        # State transition dictionary, determines the next possible character based on the current and previous character
        self.predefined_chars = ['"', '{', '}', '[', ']', ',', ':']

        self.state_transitions = {
            (None, None): ['{', '['],  # Initial state
            ('*', '{'): ['"', '[', '{', '}'],  # After '{'
            ('*', '}'): [',', '}', ']', None],  # After '}'
            ('{', '"'): ['c'],
            ('c', '"'): [':', '}', ']', ','],
            ('"', ':'): ['"', '{', '['],
            (':', '"'): ['c'],
            (',', '"'): ['c'],
            ('*', '['): ['"', '[', ']', '{'],  # After '['
            ('[', '"'): ['c'],
            ('*', ','): ['"', '[', '{'],
            ('*', 'c'): ['c', '"'],
            ('*', ']'): [',', ']', '}', None]
        }

    def transform_input(self, input_sequence):
        # Replace all non-predefined characters with 'c'
        transformed_sequence = ""
        for char in input_sequence:
            if char not in ['"', '{', '}', '[', ']', ',', ':']:
                transformed_sequence += 'c'
            else:
                transformed_sequence += char
        return transformed_sequence

    def predict_next(self, input_sequence):
        # Transform the input_sequence by replacing non-predefined characters with 'c'
        input_sequence = self.transform_input(input_sequence)

        if len(input_sequence) >= 2:
            previous_char = input_sequence[-2]
            current_char = input_sequence[-1]
        elif len(input_sequence) == 1:
            previous_char = None
            current_char = input_sequence[-1]
        else:
            previous_char = None
            current_char = None

        key = (previous_char, current_char)

        # Direct lookup in state_transitions
        if key in self.state_transitions:
            return self.state_transitions[key]

        # Handle wildcard (*) cases
        wildcard_key = ('*', current_char)
        if wildcard_key in self.state_transitions:
            return self.state_transitions[wildcard_key]

        return []
