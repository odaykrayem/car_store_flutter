// ignore: file_names
import 'package:car_store_flutter/controllers/language/LanguagesController.dart';
import 'package:car_store_flutter/controllers/theme/ThemesController.dart';
import 'package:car_store_flutter/shared/constants/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';
import 'package:car_store_flutter/shared/helpers/extensions/StringExtension.dart';

class UserTab extends StatelessWidget {
  UserTab({Key? key}) : super(key: key);
  final ThemesController _themesController = Get.find();
  final LanguagesController _languagesController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // _languagesController.setLanguage('english');

    return SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Get.isDarkMode
                      ? ColorConstants.gray450
                      : Colors.grey.shade50,
                  expandedHeight: 100.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text(
                      'settings'.tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // Text("Account",
                      //     style: theme.textTheme.headline6
                      //         ?.copyWith(fontWeight: FontWeight.w400)),
                      // const SizedBox(height: 16),
                      // Container(
                      //   height: 80,
                      //   padding: const EdgeInsets.all(16),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       color: Get.isDarkMode
                      //           ? ColorConstants.gray700
                      //           : Colors.grey.shade200),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 52,
                      //         height: 52,
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Get.isDarkMode
                      //                 ? ColorConstants.gray500
                      //                 : Colors.grey.shade300),
                      //         child: Center(
                      //           child: Icon(Icons.person,
                      //               size: 32, color: Colors.grey.shade500),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 16),
                      //       Text("Login / Register",
                      //           style: theme.textTheme.subtitle1?.copyWith(
                      //               fontWeight: FontWeight.w400,
                      //               color: Colors.blue)),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(height: 32),
                      // Text("Settings",
                      //     style: theme.textTheme.headline6
                      //         ?.copyWith(fontWeight: FontWeight.w400)),
                      const SizedBox(height: 16),
                      // GetBuilder<ThemesController>(builder: (_) {
                      //   return _buildListTile('Appearance', Icons.dark_mode,
                      //       _.theme.toCapitalized(), Colors.purple, theme,
                      //       onTab: () => _showAppearanceModal(theme, _.theme));
                      //   // return Text(_.theme);
                      // }),
                      // const SizedBox(height: 8),
                      GetBuilder<LanguagesController>(builder: (_) {
                        return _buildListTile('language'.tr, Icons.language,
                            _.language.tr, Colors.orange, theme,
                            onTab: () => _showLanguageModal(theme, _.language));
                      }),
                      const SizedBox(height: 8),
                      // _buildListTile('Notifications',
                      //     Icons.notifications_outlined, '', Colors.blue, theme,
                      //     onTab: () {}),
                      // const SizedBox(height: 8),
                      // _buildListTile(
                      //     'Help', Icons.help, '', Colors.green, theme,
                      //     onTab: () {}),
                      // const SizedBox(height: 8),
                      // _buildListTile(
                      //     'Logout', Icons.exit_to_app, '', Colors.red, theme,
                      //     onTab: () {}),
                    ],
                  ),
                  Text("Version 1.0.0",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey.shade500)),
                ],
              ),
            )));
  }

  Widget _buildListTile(
      String title, IconData icon, String trailing, Color color, theme,
      {onTab}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: Text(title, style: theme.textTheme.subtitle1),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(trailing,
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey.shade600)),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
        onTap: onTab);
  }

  _showAppearanceModal(ThemeData theme, String current) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(16),
      height: 320,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select a Theme",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(
              Icons.brightness_5,
              color: Colors.blue,
            ),
            title: Text("Light", style: theme.textTheme.bodyLarge),
            onTap: () {
              _themesController.setTheme('light');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'light' ? Colors.blue : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: Text("Dark", style: theme.textTheme.bodyLarge),
            onTap: () {
              _themesController.setTheme('dark');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'dark' ? Colors.orange : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_6,
              color: Colors.blueGrey,
            ),
            title: Text("System", style: theme.textTheme.bodyLarge),
            onTap: () {
              _themesController.setTheme('system');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'system' ? Colors.blueGrey : Colors.transparent,
            ),
          ),
        ],
      ),
    ));
  }

  _showLanguageModal(ThemeData theme, String current) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(16),
      height: 380,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "selectALanguage".tr,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(
              FlutterIcons.translate_mco,
              color: Colors.blue,
            ),
            title:
                Text("arabicLangaugeName".tr, style: theme.textTheme.bodyLarge),
            onTap: () {
              _languagesController.setLanguage('arabic');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'arabic' ? Colors.blue : Colors.transparent,
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(
              FlutterIcons.translate_mco,
              color: Colors.green,
            ),
            title: Text("kurdishLangaugeName".tr,
                style: theme.textTheme.bodyLarge),
            onTap: () {
              _languagesController.setLanguage('kurdish');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'kurdish' ? Colors.green : Colors.transparent,
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(
              FlutterIcons.translate_mco,
              color: Colors.orange,
            ),
            title: Text('englishLangaugeName'.tr,
                style: theme.textTheme.bodyLarge),
            onTap: () {
              _languagesController.setLanguage('english');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'english' ? Colors.orange : Colors.transparent,
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(
              FlutterIcons.google_translate_mco,
              color: Colors.blueGrey,
            ),
            title: Text("system".tr, style: theme.textTheme.bodyLarge),
            onTap: () {
              _languagesController.setLanguage('system');
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: current == 'system' ? Colors.blueGrey : Colors.transparent,
            ),
          ),
        ],
      ),
    ));
  }
}
