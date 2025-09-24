import 'dart:convert';

import 'package:flutter/services.dart';

import 'drug_model.dart';

abstract class DrugRepository {
  Future<List<Drug>> getAllDrugs();
  Future<List<Drug>> searchDrugsByTradename(String query);
}

class JsonDrugRepository implements DrugRepository {
  static const String _jsonPath = 'assets/data/drugs.json';
  List<Drug>? _cachedDrugs;

  @override
  Future<List<Drug>> getAllDrugs() async {
    if (_cachedDrugs != null) {
      return _cachedDrugs!;
    }

    try {
      final String jsonString = await rootBundle.loadString(_jsonPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> drugsJson = jsonData['drugs'] ?? [];

      _cachedDrugs = drugsJson
          .map((drugJson) => Drug.fromJson(drugJson))
          .toList();

      return _cachedDrugs!;
    } catch (e) {
      throw Exception('Failed to load drugs data: $e');
    }
  }

  @override
  Future<List<Drug>> searchDrugsByTradename(String query) async {
    if (query.isEmpty) return [];

    final drugs = await getAllDrugs();
    final lowercaseQuery = query.toLowerCase();

    return drugs.where((drug) {
      return drug.tradename.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  void clearCache() {
    _cachedDrugs = null;
  }
}


