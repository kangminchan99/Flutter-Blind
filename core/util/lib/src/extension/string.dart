import 'package:core_util/src/util/pattern.dart';

extension StringExtension on String {
  bool get isWebUrl {
    if (isEmpty) return false;
    return urlPattern.hasMatch(this);
  }
}
