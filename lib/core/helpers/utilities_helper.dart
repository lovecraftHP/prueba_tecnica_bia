import 'dart:convert';

import 'package:crypto/crypto.dart';

mixin UtilitiesHelper {
  String createHashparam(String values) =>
      md5.convert(utf8.encode(values)).toString();
}
