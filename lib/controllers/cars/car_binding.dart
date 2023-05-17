import 'package:car_store_flutter/providers/car_provider.dart';
import 'package:get/get.dart';

import '../../repositories/car_repository.dart';
import 'car_controller.dart';

class CarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarRepository>(() => CarRepository(Get.find()));
    Get.lazyPut<CarProvider>(() => CarProvider(Get.find()));

    Get.lazyPut<CarController>(() => CarController(Get.find()));
  }
}
