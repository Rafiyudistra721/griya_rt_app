import 'package:get/get.dart';

import '../controllers/inven_controller.dart';

class InvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvenController>(
      () => InvenController(),
    );
  }
}
