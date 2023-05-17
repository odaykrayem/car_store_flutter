// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_store_flutter/services/networking/interceptors/RequestInterceptor.dart';
import 'package:car_store_flutter/services/networking/interceptors/ResponseInterceptor.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
  }) {
    allowAutoSignedCert = true;

    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 20);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    debugPrint('api Client:$body');

    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      debugPrint(response.toString());
      debugPrint('response :: ${response.bodyString}');

      return response;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('${2}');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
