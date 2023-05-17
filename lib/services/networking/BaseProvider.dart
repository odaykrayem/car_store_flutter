import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:car_store_flutter/services/networking/ApiConstants.dart';
import 'package:car_store_flutter/services/networking/interceptors/RequestInterceptor.dart';
import 'package:car_store_flutter/services/networking/interceptors/ResponseInterceptor.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;

    timeout = const Duration(seconds: 25);
    httpClient.timeout = const Duration(seconds: 25);
    allowAutoSignedCert = true;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
