import 'package:flutter/foundation.dart';

extension StringExtension on String {
  List<String> stringToList() {
    List<String> list = [];
    for (int i = 0; i < length; i++) {
      String char = this[i];
      list.add(char);
    }

    return list;
  }
}
