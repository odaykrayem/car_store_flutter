// ignore_for_file: file_names
import 'package:car_store_flutter/controllers/cars/car_controller.dart';
import 'package:car_store_flutter/controllers/home/HomeController.dart';
import 'package:car_store_flutter/repositories/car_repository.dart';
import 'package:car_store_flutter/repositories/exhibition_repository.dart';
import 'package:car_store_flutter/services/networking/ApiConstants.dart';
import 'package:car_store_flutter/services/networking/api_client.dart';
import 'package:get/get.dart';
import '../../providers/car_provider.dart';
import '../../providers/city_provider.dart';
import '../../providers/company_provider.dart';
import '../../providers/exhibition_provider.dart';
import '../../repositories/city_repo.dart';
import '../../repositories/company_repo.dart';
import '../exhibitions/exhibition_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CategoryRepository>(() => CategoryRepository(Get.find()));
    // Get.lazyPut<CategoryProvider>(() => CategoryProvider(Get.find()));

    Get.lazyPut<ApiClient>(() => ApiClient(appBaseUrl: ApiConstants.baseUrl));
    Get.lazyPut<CarRepository>(() => CarRepository(Get.find()));
    Get.lazyPut<CarProvider>(() => CarProvider(Get.find()));
    Get.lazyPut<CityRepository>(() => CityRepository(Get.find()));
    Get.lazyPut<CityProvider>(() => CityProvider(Get.find()));
    Get.lazyPut<CompanyRepository>(() => CompanyRepository(Get.find()));
    Get.lazyPut<CompanyProvider>(() => CompanyProvider(Get.find()));
    Get.lazyPut<ExhibitionRepository>(() => ExhibitionRepository(Get.find()));
    Get.lazyPut<ExhibitionProvider>(() => ExhibitionProvider(Get.find()));

    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<CarController>(() => CarController(Get.find()));
    Get.lazyPut<ExhibitionController>(() => ExhibitionController(Get.find()));
  }
}
