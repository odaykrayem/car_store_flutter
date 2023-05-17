// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguagesController extends GetxController {
  final storage = GetStorage();

  var language = 'kurdish';

  @override
  void onInit() {
    super.onInit();

    getLanguageState();
  }

  getLanguageState() {
    if (storage.read('language') != null) {
      return setLanguage(storage.read('language'));
    }

    setLanguage('kurdish');
  }

  void setLanguage(String value) {
    language = value;
    storage.write('language', value);

    Get.updateLocale(value == 'system'
        ? Get.deviceLocale!
        : Locale(value == 'english'
            ? 'en'
            : value == 'arabic'
                ? 'ar'
                : 'fa'));

    update();
  }
}
