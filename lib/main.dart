import 'dart:io';

import 'package:car_store_flutter/controllers/language/LanguagesController.dart';
import 'package:car_store_flutter/controllers/theme/ThemesController.dart';
import 'package:car_store_flutter/services/networking/httoover.dart';
import 'package:car_store_flutter/themes/Themes.dart';
import 'package:car_store_flutter/translation/localization/localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:car_store_flutter/AppBinding.dart';
import 'package:car_store_flutter/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());
  final LanguagesController languageController = Get.put(LanguagesController());

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto mart',
      theme: Themes.darkTheme,
      darkTheme: Themes.darkTheme,
      themeMode: getThemeMode(themeController.theme),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
      translations: AppLocalization(),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
