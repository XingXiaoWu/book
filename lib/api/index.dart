///
///Author: Xing.Wu
///Date: 2021-04-02 18:03:54
///LastEditTime: 2021-04-04 00:42:50
///LastEditors: Xing.wu
///Description:
///我是阿星，祝你幸福
///

import 'package:dio/dio.dart';
import 'package:flutter_book/api/http.dart';
import 'package:flutter_book/models/findModel.dart';

class Api {
  /// 获取http
  static Http http = Http();

  /// 发现页接口
  static Future<FindModel> getFindFeature() async {
    Response response = await http.dio.get('');
    FindModel findModel = FindModel.fromJson(response.data);
    return findModel;
  }
}
