import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:product/response/error_response.dart';

class ApiClient extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri).then((value) {
        log('GetX response=====>${value.body}');
        return value;
      });

      Response == handleResponse(response);
      if (kDebugMode) {
        log('GetX response=====>${response.body}');
      }
      return response;
    } catch (e) {
      return const Response();
    }
  }
}

class UserApiClient extends GetConnect implements GetxService {
  Future<Response> usergetData(String uri) async {
    try {
      Response response = await get(uri).then((value) {
        log('GetX response=====>${value.body}');
        return value;
      });

      Response == handleResponse(response);
      if (kDebugMode) {
        log('GetX response=====>${response.body}');
      }
      return response;
    } catch (e) {
      return const Response();
    }
  }
}

Response handleResponse(Response response) {
  Response _response = response;
  if (_response.hasError &&
      _response.body != null &&
      _response.body is! String) {
    if (_response.body.toString().startsWith('{errors: [{code:')) {
      ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
      _response = Response(
          statusCode: _response.statusCode,
          body: _response.body,
          statusText: _errorResponse.errors?[0].message);
    } else if (_response.body.toString().startsWith('{message')) {
      _response = Response(
          statusCode: _response.statusCode,
          body: _response.body,
          statusText: _response.body['message']);
    }
  } else if (_response.hasError && _response.body == null) {
    _response = Response(
        statusCode: 0,
        statusText:
            'Connection to API server failed due to internet connection');
  }
  return _response;
}
