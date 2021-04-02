import 'package:dio/dio.dart';

///
///Author: Xing.Wu
///Date: 2021-04-02 18:03:54
///LastEditTime: 2021-04-02 18:10:33
///LastEditors: Xing.wu
///Description:
///我是阿星，祝你幸福
///

class Api {
  var dio = Dio(BaseOptions(
      baseUrl: 'http://yuenov.com:15555',
      connectTimeout: 5000,
      receiveTimeout: 100000,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain));
}
