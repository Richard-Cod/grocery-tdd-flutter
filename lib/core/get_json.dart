import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

getJson(path) async {
  final fixturesPath = 'fixtures/$path';
  var string;

  bool condition = Platform.environment.containsKey('FLUTTER_TEST');

  if (condition) {
    var file = File(fixturesPath);
    string = await file.readAsString();
  } else {
    string = await rootBundle.loadString(fixturesPath);
  }

  return jsonDecode(string);
}
