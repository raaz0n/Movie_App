import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/internet_connection.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  static const String userAgent = 'User-Agent';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';

  Future<Map<String, String>> _createCommonHeader() async {
    final common = <String, String>{};
    common[accept] = ContentType.json.toString();
    return common;
  }

  Future<http.Response> get(
      {required String path, required Map<String, String> headers}) async {
    var isInternet = await CheckInternetConnection().isInternet();
    debugPrint('🌍 🌍 🌍-------------------------------');
    debugPrint('GET Request');
    debugPrint(path);
    debugPrint(headers.toString());
    debugPrint('🌍 🌍 🌍-------------------------------');
    headers.addAll(await _createCommonHeader());

    if (isInternet) {
      final response = await _client.get(
          Uri.parse(
              '${ApiConstant.BASE_URL}$path?api_key=${ApiConstant.API_KEY}'),
          headers: headers);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } else {
      log("message");
      return http.Response("", 503);
    }
  }
}
