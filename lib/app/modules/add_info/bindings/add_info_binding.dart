import 'package:get/get.dart';

import '../controllers/add_info_controller.dart';

class AddInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddInfoController>(
      () => AddInfoController(),
    );
  }
}
