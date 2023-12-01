import 'package:get/get.dart';

import '../controllers/tran_form_controller.dart';

class TranFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranFormController>(
      () => TranFormController(),
    );
  }
}
