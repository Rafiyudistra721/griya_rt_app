import 'package:get/get.dart';

import '../controllers/warga_controller.dart';

class WargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WargaController>(
      () => WargaController(),
    );
  }
}
