import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

enum KwArr { TargetId, TypeKey, CssName, Name, Note, QueryCount }


// 首页数据
class IndexDataInfo with ChangeNotifier {
  Dio _dio = Dio();

  // 输入框value
  var _inputValue = '';
  var _searchKeywords = [];
  var _keyWordsList = [];
  var _keyWordList = [];

  get inputValue => _inputValue;
  get searchKeywords => _searchKeywords;
  get keyWordsList => _keyWordsList;
  get keyWordList => _keyWordList;

  // 获取输入的值
  void setInputValue(String v) {
    _inputValue = v;
    notifyListeners();

    if (v != "") {
      search(v);
    }
  }

  // 清理
  void clearInputValue(String v) {
    _inputValue = v;
    _searchKeywords = [];
    notifyListeners();
  }

  // 请求值
   void search(String keywords) async {
    try {
      Response response = await _dio.get(
          "https://sffc.sh-service.com/wx_miniprogram/sites/feiguan/trashTypes_2/Handler/Handler.ashx?a=GET_KEYWORDS&kw=$keywords");
      // 序列化json对象
      final data = json.decode(response.data) as Map<String, dynamic>;
      if (data["kw_list"] != null && data["kw_list"].length > 0) {
        List kwList = data["kw_list"];
        List kwArr = data["kw_arr"];
        _searchKeywords = kwList.cast<String>().toList();
        _keyWordsList = kwArr.cast<Object>().toList();

        print(_searchKeywords);
        print(_keyWordsList);
        notifyListeners();
      }
    }catch(e) {
      print(e);
    }
  }

  // 提取数据
  void searchWast(String name) {
    for (var item in _keyWordsList) {
      if(item['Name'] == name){
        _keyWordList = item;
      }
    }
    notifyListeners();
  }
}