# 📚 DictLib

**DictLib** is a lightweight Dart library that generates brute-force
permutations of characters, useful for dictionary-based attacks, fuzzing, or
exhaustive testing.

## 🚀 Features

- Customizable character set (`a-z`, `0-9`, or anything else).
- Supports fixed-length brute-force iteration.
- Efficient, memory-friendly iterator — no need to store the entire dictionary in memory.
- Clean Dart idiomatic API (`Iterable<String>`).

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  dictlib:
    git:
      url: https://github.com/yhojann-cl/dart-dictlib
```

Or use it locally:

```yaml
dependencies:
  dictlib:
    path: ./path/to/dictlib
```

## 🧑‍💻 Usage

```dart
import 'package:dictlib/dictlib.dart';

void main() {
    final dict = DictLib(length: 3, characters: 'abc');

    for (final word in dict) {
        print(word);
    }
}
// [ 'a', 'b', 'c', 'aa', 'ab' ... 'cca', 'ccb', 'ccc' ]
```


## ⚙️ API

```dart
DictLib({
    int length = 4,
    String characters = 'abcdefghijklmnopqrstuvwxyz0123456789',
});
```

| Parameter    | Type     | Default                                  | Description                              |
| ------------ | -------- | ---------------------------------------- | ---------------------------------------- |
| `length`     | `int`    | `4`                                      | Number of characters per word            |
| `characters` | `String` | `'abcdefghijklmnopqrstuvwxyz0123456789'` | Characters used to generate permutations |


## DictLibStop

Custom exception used internally when iteration ends:

- Brute-force password testing.
- Input fuzzing.
- Code generation for short random tokens.
- Dictionary word expansion for testing.


## Contributions

This project is open source and under active development. Contributions, bug
reports, and suggestions are welcome via [GitHub](https://github.com/yhojann-cl/dart-dictlib).
