import 'dart:convert';
import 'dart:io';

import 'package:finances_easy_app/src/helpers/exceptions.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  static final _baseUrl = GlobalConfiguration().getString('api');

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: await _getHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, String body) async {
    var responseJson;
    try {
      final response =
          await http.post(_baseUrl + url, headers: await _getHeaders(), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, int id) async {
    var responseJson;
    try {
      final response =
          await http.post(_baseUrl + url + '/$id', headers: await _getHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

   Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: ContentType.json.value
    };
    if(prefs.getString('token') != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer ' + prefs.getString('token');
    }
    return headers;
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
