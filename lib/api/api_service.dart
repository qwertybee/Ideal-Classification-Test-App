import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_2/api/category_api/cateMajor/major_edu.dart';
import 'category_api/cateBroad/broad_edu.dart';
import 'category_api/cateBroad/broad_skill.dart';
import 'category_api/cateDetail/detail_edu.dart';
import 'category_api/cateDetail/detail_skill.dart';
import 'category_api/cateMajor/major_skill.dart';
import 'category_api/cateMinor/minor_edu.dart';
import 'category_api/cateMinor/minor_skill.dart';
import 'category_api/wage_cat.dart';

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

  Future<MajEdu?> getMajorEdu(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        MajEdu _model = majEduFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<MajSkill?> getMajorSkill(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        MajSkill _model = majSkillFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<BroadEdu?> getBroadEdu(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        BroadEdu _model = broadEduFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
  Future<BroadSkill?> getBroadSkill(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        BroadSkill _model = broadSkillFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<MinorEdu?> getMinorEdu(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        MinorEdu _model = minorEduFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<MinorSkill?> getMinorSkill(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        MinorSkill _model = minorSkillFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<DetailEdu?> getDetailEdu(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        DetailEdu _model = detailEduFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<DetailSkill?> getDetailSkill(String link) async {
    try {
      var url = Uri.parse(link);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        DetailSkill _model = detailSkillFromJson(response.body);
        return _model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
