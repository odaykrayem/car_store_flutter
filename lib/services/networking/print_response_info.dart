// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void printResponseInfo(Response<dynamic> response) {
  debugPrint('Response Body =====${response.body}');
  debugPrint('Response Status Code  : ${response.statusCode}');

  if (response.statusCode == 200) {
    debugPrint('Response Data =====${response.body['data']}');
  }
  debugPrint('Response BodyString  : ${response.bodyString}');
  debugPrint('Response Status Text responce : ${response.statusText}');
}
