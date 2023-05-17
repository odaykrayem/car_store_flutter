import 'package:car_store_flutter/controllers/cars/store_cars_controller.dart';
import 'package:car_store_flutter/providers/car_provider.dart';
import 'package:get/get.dart';

import '../../repositories/car_repository.dart';

class StoreCarsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarRepository>(() => CarRepository(Get.find()));
    Get.lazyPut<CarProvider>(() => CarProvider(Get.find()));

    Get.lazyPut<StoreCarsController>(() => StoreCarsController(Get.find()));
  }
}
