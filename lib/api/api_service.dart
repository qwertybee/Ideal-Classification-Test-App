import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'wage_cat.dart';
import 'constants.dart';

class ApiService {
  Future<WageCat?> getCategoriesWage(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WageCat _model = wageCatFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
