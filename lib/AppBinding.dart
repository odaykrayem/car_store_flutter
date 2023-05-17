import 'package:car_store_flutter/services/networking/ApiService.dart';
import 'package:car_store_flutter/services/networking/BaseProvider.dart';
import 'package:car_store_flutter/services/networking/network_manager.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
    Get.put(GetXNetworkManager(), permanent: true);
  }
}
