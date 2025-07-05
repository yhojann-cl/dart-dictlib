import 'package:dictlib/dictlib.dart';


void main() {

    // Create iterator
    final DictLib brute = DictLib(length: 2, characters: 'abc');

    // Print first 5 words
    print(brute.take(5).toList());
    // [ 'a', 'b', 'c', 'aa', 'ab' ]
}