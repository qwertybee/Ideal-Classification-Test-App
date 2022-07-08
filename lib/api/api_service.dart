
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'wage_sales.dart';
import 'constants.dart';

class ApiService {
  Future<WageSales?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        WageSales _model = wageSalesFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
