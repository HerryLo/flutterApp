import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:convert';
import 'dart:io';

// 首页数据
class IndexDataInfo with ChangeNotifier {
  Dio _dio = Dio();

  // 输入框value
  String _inputValue = '';
  List<String> _searchKeywords = [];

  String get inputValue => _inputValue;
  List<String> get searchKeywords => _searchKeywords;

  // 获取输入的值
  setInputValue(String v) {
    _inputValue = v;
    notifyListeners();

    if (v != "") {
      search(v);
    }
  }

  clearInputValue(String v) {
    _inputValue = v;
    notifyListeners();
  }

  // 请求值
  search(String keywords) async {
    Response<Map<String, dynamic>> response = await _dio.get(
        "https://sffc.sh-service.com/wx_miniprogram/sites/feiguan/trashTypes_2/Handler/Handler.ashx?a=GET_KEYWORDS&kw=$keywords");
    Map<String, dynamic> data = response.data;
    if (data["kw_list"] != null) {
      List<dynamic> list = data["kw_list"];
      _searchKeywords = list.cast<String>().toList();
      notifyListeners();

      print(_searchKeywords);
    }
  }

  // 判断类型
  searchWast(String name) async {
    Response<Map<String, dynamic>> response = await _dio.get(
        "https://sffc.sh-service.com/wx_miniprogram/sites/feiguan/trashTypes_2/Handler/Handler.ashx?a=EXC_QUERY&kw=$name");
    Map<String, dynamic> data = response.data;
//    var model = WastSearchEntity.fromJson(data);
//    _wastSearch = WastModel.fromSearch(model.queryResultType1.trashType);
    notifyListeners();
  }

}