import 'dart:convert';

import 'package:app/domain/tests.dart';
import 'package:shared_preferences/shared_preferences.dart';

const location = 'test';

class TestRepository {
  List<Test>? _tests;
  late final SharedPreferences prefs;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(location);
    if (json != null) {
      var map = jsonDecode(json) as List<Map<String, dynamic>>;
      _tests = map.map(Test.fromJson).toList(growable: false);
    }
  }

  bool get hasItems => _tests != null;

  List<Test>? get tests => _tests;

  void save(List<Test> tests) {
    _tests = _tests;
    saveOnStorage();
  }

  void saveOnStorage() {
    final json = jsonEncode(_tests);
    prefs.setString(location, json);
  }

  void delete(){
    _tests = null;
    prefs.remove(location);
  }
}
