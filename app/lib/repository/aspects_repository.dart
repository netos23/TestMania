import 'dart:convert';

import 'package:app/domain/aspects.dart';
import 'package:flutter/services.dart' show rootBundle;

class AspectsRepository {
  late final List<Aspect> aspects;

  Future<void> initialize() async {
    final countries = await rootBundle.loadString('assets/countries.json');
    final countriesMap = jsonDecode(countries) as Map<String, dynamic>;
    aspects = countriesMap.entries
        .map((e) => Aspect(name: e.value, images: [e.key]))
        .toList();
  }
}
