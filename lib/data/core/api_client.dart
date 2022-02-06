import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_constant.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse('${ApiConstant.BASE_URL}$path?api_key=${ApiConstant.API_KEY}'),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
