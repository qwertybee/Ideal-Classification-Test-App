import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<int, int> userSkillVals = {}; // key int is the unique page, val int is val from button clicked

  void setMapVal(int key, int val) {
    userSkillVals[key] = val;
    // notifyListeners();
  }

  int? getMapVal(int key) {
    // notifyListeners();
    return userSkillVals[key];
  }

}