import 'package:dictlib/dictlib.dart';


void main() {

    // Create iterator
    final DictLib brute = DictLib(length: 2, characters: 'abc');

    // Process each word
    for (final word in brute) {
        print(word);
    }
}