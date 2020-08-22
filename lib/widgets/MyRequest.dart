import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MyRequest {
  static get({@required String url}) {
    return dio.get(url);
  }

  static post({@required String url, @required data}) {
    return dio.post(url, data: data);
  }

  static upload(
      {@required String url,
      @required List<Map<String, String>> formDataList}) {
    List files = formDataList
        .map((item) =>
            MultipartFile.fromFileSync(item['path'], filename: item['name']))
        .toList();

    FormData formData = FormData.fromMap({"files": files});
    return dio.post(url, data: formData);
  }
}
