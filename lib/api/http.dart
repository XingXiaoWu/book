///
///Author: Xing.Wu
///Date: 2021-04-03 23:26:09
///LastEditTime: 2021-04-04 00:42:03
///LastEditors: Xing.wu
///Description:  dio封装
///我是阿星，祝你幸福
///
import 'package:dio/dio.dart';
import 'package:flutter_book/api/url.dart';

class Http {
  /// dio实例化
  Dio dio = Dio();

  /// 初始化
  Http() {
    var options = BaseOptions(
        baseUrl: URLS.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 100000,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain);
    dio.options = options;
    this.setInterceptors();
  }

  /// 设置拦截器
  void setInterceptors() {
    this
        .dio
        .interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
          // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
          //
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        }, onResponse: (response, handler) {
          /// 是否成功
          if (response.data.result.code == '0') {
            return handler.next(response);
          } else {
            return handler.reject(response.data.result.msg);
          }
        }, onError: (DioError e, handler) {
          // 弹出Toast
          return handler.next(e); //continue
          // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        }));
  }
}
