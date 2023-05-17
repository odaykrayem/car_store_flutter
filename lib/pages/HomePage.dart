// ignore_for_file: file_names
import 'package:car_store_flutter/controllers/home/HomeController.dart';
import 'package:car_store_flutter/shared/constants/ColorConstants.dart';
import 'package:car_store_flutter/shared/constants/StringConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/networking/network_manager.dart';

class HomePage extends GetView<GetXNetworkManager> {
  HomePage({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Get.isDarkMode
                    ? ColorConstants.gray700
                    : ColorConstants.gray100,
                Get.isDarkMode
                    ? ColorConstants.gray700.withOpacity(0.2)
                    : ColorConstants.gray100.withOpacity(0.7)
              ],
            ),
          ),
        ),
        controller: _homeController.advancedDrawerController,
        animationCurve: Curves.easeInOutBack,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: Get.locale == const Locale('en') ? false : true,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
            child: Container(
          child: ListTileTheme(
            textColor: Colors.white,

            // textColor: ColorConstants.darkGreen4,
            iconColor: ColorConstants.green,
            // iconColor: ColorConstants.darkGreen4,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 55.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // color: Colors.black26,
                    color: ColorConstants.darkGrey,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      // colorFilter: ColorFilter.mode(
                      //     ColorConstants.green, BlendMode.srcATop),
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  // child: Image.asset(
                  //   'assets/images/auto_mart_logo.png',
                  // ),
                ),
                _drawerItem(
                    title: 'home'.tr, icon: CupertinoIcons.home, page: 0),
                _drawerItem(
                    title: 'cars'.tr, icon: CupertinoIcons.car, page: 1),
                _drawerItem(
                    title: 'exhibitions'.tr,
                    icon: CupertinoIcons.building_2_fill,
                    page: 2),
                _drawerItem(
                    title: 'settings'.tr, icon: CupertinoIcons.gear, page: 3),
                _drawerItem(
                    title: 'aboutUs'.tr, icon: CupertinoIcons.info, page: 4),
                const Spacer(),
                _contactUsItem(),
                const Spacer(),
                // DefaultTextStyle(
                //   style: theme.textTheme.bodySmall!
                //       .copyWith(color: Colors.grey.shade600),
                //   // style: const TextStyle(
                //   //   fontSize: 12,
                //   //   color: Colors.white54,
                //   // ),
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(
                //       vertical: 16.0,
                //     ),
                //     child: const Text('Terms of Service | Privacy Policy'),
                //   ),
                // ),
              ],
            ),
          ),
        )),
        child: Scaffold(
            // bottomNavigationBar: BottomAppBar(
            //   elevation: 0,
            //   notchMargin: 10,
            //   child: Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //       child: Obx(
            //         () => Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             _bottomAppBarItem(icon: IconlyLight.home, page: 0),
            //             _bottomAppBarItem(icon: IconlyLight.bookmark, page: 1),
            //             _bottomAppBarItem(icon: IconlyLight.buy, page: 2),
            //             _bottomAppBarItem(icon: IconlyLight.profile, page: 3),
            //           ],
            //         ),
            //       )),
            // ),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                StringConstants.appName,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: Colors.white, fontFamily: 'Rabar'),
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _homeController.advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible
                            ? Icons.clear_rounded
                            : Icons.menu_rounded,
                        color: ColorConstants.green,
                        size: 30,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: GestureDetector(
                      onTap: () {
                        if (_homeController.currentPage.value != 1)
                          _homeController.goToTab(1);
                        else
                          _homeController.showFilterModal();
                      },
                      child: Icon(Icons.filter_alt_outlined,
                          size: 30, color: ColorConstants.green)),
                  // Image.asset(
                  //   'assets/images/auto_mart_logo.png',
                  //   width: 25,
                  //   height: 25,
                  // )
                  //     Container(
                  //   width: 30,
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //     // color: const Color(0xff7c94b6),
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       colorFilter: ColorFilter.mode(
                  //           ColorConstants.green, BlendMode.srcATop),
                  //       image: const AssetImage(
                  //         'assets/images/auto_mart_logo.png',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
            body: PageView(
              controller: _homeController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [..._homeController.pages],
            )));
  }

  Widget _drawerItem({title, icon, page}) {
    return ListTile(
      onTap: () {
        _homeController.goToTab(page);
        _homeController.advancedDrawerController.hideDrawer();
      },
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _contactUsItem({icon}) {
    return ListTile(
      // contentPadding: EdgeInsets.all(5),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              iconSize: 40,
              onPressed: () async {
                final Uri _url = Uri.parse(
                    'https://www.facebook.com/profile.php?id=100092588324727');
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              icon: Image.asset('assets/images/facebook1.png')),
          IconButton(
              iconSize: 42,
              onPressed: () async {
                final Uri _url =
                    Uri.parse('https://www.instagram.com/otomart.iq/');
                if (!await launchUrl(_url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $_url');
                }
              },
              icon: Image.asset('assets/images/instagram1.png')),
          IconButton(
              iconSize: 38,
              onPressed: () async {
                final Uri _url = Uri.parse(
                    'mailto:Otomart.iq@gmail.com?subject=Greetings&body=Hello');
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              icon: Image.asset(
                'assets/images/gmail1.png',
              )),
        ],
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _homeController.advancedDrawerController.showDrawer();
  }

  // Widget _bottomAppBarItem({icon, page}) {
  //   return ZoomTapAnimation(
  //     onTap: () => _homeController.goToTab(page),
  //     child: Icon(
  //       icon,
  //       color: _homeController.currentPage == page ? Colors.blue : Colors.grey,
  //       size: 22,
  //     ),
  //   );
  // }
}
