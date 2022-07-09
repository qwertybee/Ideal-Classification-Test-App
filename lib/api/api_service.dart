import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'wage_major.dart';
import 'constants.dart';

class ApiService {
  Future<WageMajor?> getInfo() async {
    try {
      var url = Uri.parse("");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WageMajor _model = wageMajorFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<WageMajor?> getCategoriesWage() async {
    try {
      var url = Uri.parse(ApiConstants.categoriesMajorWage);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WageMajor _model = wageMajorFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
