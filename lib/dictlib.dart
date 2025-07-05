library;

class DictLibStop implements Exception {

    @override
    String toString() => '[DictLibStop]';
}


class DictLib extends Iterable<String> {

    final int length;
    final String characters;

    DictLib({
        this.length = 4,
        this.characters = 'abcdefghijklmnopqrstuvwxyz0123456789',
    }) {
        if (length <= 0)
            throw ArgumentError('Valid length is required.');
    }

    @override
    Iterator<String> get iterator => DictLibIter(length, characters);
}


class DictLibIter implements Iterator<String> {

    final int length;
    final String characters;
    final List<int?> _stack;
    int _currentIndexStack = 0;
    String? _current;

    DictLibIter(this.length, this.characters)
      : _stack = List.filled(length, null);

    @override
    String get current => _current!;

    @override
    bool moveNext() {
        try {
            _current = _nextWord();
            return true;
        } on DictLibStop {
            return false;
        }
    }

    String _nextWord() {
        if (characters.isEmpty || _stack.isEmpty) {
            throw DictLibStop();
        }

        if ((_stack.length - 1) < _currentIndexStack) {
            _stack[_currentIndexStack] = 0;
        } else {
            _stack[_currentIndexStack] = (_stack[_currentIndexStack] ?? -1) + 1;
        }

        if (_stack[_currentIndexStack]! > characters.length - 1) {
            _stack[_currentIndexStack] = 0;

            int prevIndex = _currentIndexStack - 1;
            while (true) {
                if (prevIndex < 0) {
                    _currentIndexStack += 1;

                    if (_currentIndexStack > (_stack.length - 1)) {
                        throw DictLibStop();
                    }

                    _stack[_currentIndexStack] = 0;
                    break;

                } else {
                    _stack[prevIndex] = (_stack[prevIndex] ?? -1) + 1;

                    if (_stack[prevIndex]! > characters.length - 1) {
                        _stack[prevIndex] = 0;
                        prevIndex -= 1;
                    } else {
                        break;
                    }
                }
            }
        }

        final buffer = StringBuffer();
        for (int i = 0; i < _stack.length; i++) {
            if (_stack[i] == null) continue;
            buffer.write(characters[_stack[i]!]);
        }

        return buffer.toString();
    }
}