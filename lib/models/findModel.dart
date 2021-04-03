///
///Author: Xing.Wu
///Date: 2021-04-03 22:30:18
///LastEditTime: 2021-04-03 23:00:05
///LastEditors: Xing.wu
///Description:  发现页Model
///我是阿星，祝你幸福
///
import 'package:flutter_book/utils/jsonUntil.dart';
import 'dart:convert';

class FindModel {
  FindModel({
    required this.data,
    required this.result,
  });

  factory FindModel.fromJson(Map<String, dynamic> jsonRes) => FindModel(
        data: Data.fromJson(asT<Map<String, dynamic>>(jsonRes['data'])!),
        result: Result.fromJson(asT<Map<String, dynamic>>(jsonRes['result'])!),
      );

  Data data;
  Result result;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
        'result': result,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Data {
  Data({
    required this.listData,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<ListData>? listData =
        jsonRes['list'] is List ? <ListData>[] : null;
    if (listData != null) {
      for (final dynamic item in jsonRes['list']!) {
        if (item != null) {
          listData.add(ListData.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Data(
      listData: listData!,
    );
  }

  List<ListData> listData;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'list': listData,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class ListData {
  ListData({
    required this.bookList,
    required this.categoryName,
    required this.type,
    this.categoryId,
  });

  factory ListData.fromJson(Map<String, dynamic> jsonRes) {
    final List<BookList>? bookList =
        jsonRes['bookList'] is List ? <BookList>[] : null;
    if (bookList != null) {
      for (final dynamic item in jsonRes['bookList']!) {
        if (item != null) {
          bookList.add(BookList.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return ListData(
      bookList: bookList!,
      categoryName: asT<String>(jsonRes['categoryName'])!,
      type: asT<String>(jsonRes['type'])!,
      categoryId: asT<int?>(jsonRes['categoryId']),
    );
  }

  List<BookList> bookList;
  String categoryName;
  String type;
  int? categoryId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bookList': bookList,
        'categoryName': categoryName,
        'type': type,
        'categoryId': categoryId,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class BookList {
  BookList({
    required this.author,
    required this.bookId,
    required this.categoryName,
    required this.chapterStatus,
    required this.coverImg,
    required this.desc,
    required this.title,
    required this.word,
  });

  factory BookList.fromJson(Map<String, dynamic> jsonRes) => BookList(
        author: asT<String>(jsonRes['author'])!,
        bookId: asT<int>(jsonRes['bookId'])!,
        categoryName: asT<String>(jsonRes['categoryName'])!,
        chapterStatus: asT<String>(jsonRes['chapterStatus'])!,
        coverImg: asT<String>(jsonRes['coverImg'])!,
        desc: asT<String>(jsonRes['desc'])!,
        title: asT<String>(jsonRes['title'])!,
        word: asT<String>(jsonRes['word'])!,
      );

  String author;
  int bookId;
  String categoryName;
  String chapterStatus;
  String coverImg;
  String desc;
  String title;
  String word;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'author': author,
        'bookId': bookId,
        'categoryName': categoryName,
        'chapterStatus': chapterStatus,
        'coverImg': coverImg,
        'desc': desc,
        'title': title,
        'word': word,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Result {
  Result({
    required this.code,
    required this.msg,
  });

  factory Result.fromJson(Map<String, dynamic> jsonRes) => Result(
        code: asT<int>(jsonRes['code'])!,
        msg: asT<String>(jsonRes['msg'])!,
      );

  int code;
  String msg;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'msg': msg,
      };
  @override
  String toString() {
    return jsonEncode(this);
  }
}
