import 'dart:convert';
import 'dart:io';

getJson(path) async {
  final file = File('fixtures/$path');
  final json = jsonDecode(await file.readAsString());
  return json;
}
