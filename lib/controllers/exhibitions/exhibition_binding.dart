import 'package:get/get.dart';

import '../../providers/exhibition_provider.dart';
import '../../repositories/exhibition_repository.dart';
import 'exhibition_controller.dart';

class ExhibitionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExhibitionRepository>(() => ExhibitionRepository(Get.find()));
    Get.lazyPut<ExhibitionProvider>(() => ExhibitionProvider(Get.find()));

    Get.lazyPut<ExhibitionController>(() => ExhibitionController(Get.find()));
  }
}
