import 'package:car_store_flutter/controllers/home/HomeBinding.dart';
import 'package:car_store_flutter/pages/SplashPage.dart';
import 'package:car_store_flutter/pages/HomePage.dart';
import 'package:get/route_manager.dart';

import '../controllers/cars/car_binding.dart';
import '../controllers/cars/store_cars_binding.dart';
import '../controllers/exhibitions/exhibition_binding.dart';
import '../pages/car_page.dart';
import '../pages/no_connection.dart';
import '../pages/screens/cexhibition_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static const String splashPage = "/splash";
  static const String homePage = "/home";
  static const String carsPage = "/cars";
  static const String carPage = "/car";
  static const String exhibitionPage = "/exhibition";
  static const String exhibitionsPage = "/exhibitions";
  static const String noConnectionPage = "/no_connection";

  static String getSplashPage() => splashPage;
  static String getHomePage() => homePage;
  static String getCarsPage() => carsPage;
  static String getCarPage(int carId) => '$carPage?id=$carId';
  static String getExhibitionPage(int id) => '$exhibitionPage?id=$id';
  static String getExhibitionsPage() => exhibitionsPage;
  static String getNoConnectionPage() => noConnectionPage;

  static final routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: noConnectionPage,
      page: () => const NoConnection(),
    ),

    GetPage(
        name: homePage,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: carsPage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: exhibitionsPage,
      page: () => HomePage(),
      binding: ExhibitionBinding(),
    ),
    GetPage(
        name: carPage,
        binding: CarBinding(),
        page: () {
          int? id = Get.parameters['id'] == null
              ? null
              : int.parse(Get.parameters['id']!);
          return CarPage(
            id,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: exhibitionPage,
        binding: StoreCarsBinding(),
        page: () {
          int? id = Get.parameters['id'] == null
              ? null
              : int.parse(Get.parameters['id']!);
          return ExhibitionPage(
            id,
          );
        },
        transition: Transition.fadeIn),

    // GetPage(
    //   name: '/product/:id',
    //   page: () => const ProductPage(),
    //   binding: ProductBinding(),
    // )
  ];
}

// GetPage(
//         name: otpUpdatePassPage,
//         page: () {
//           var phone = Get.parameters['phone'];
//           return OTPUpdatePassScreen(
//             number: '$phone',
//           );
//         },
//         transition: Transition.fadeIn),
