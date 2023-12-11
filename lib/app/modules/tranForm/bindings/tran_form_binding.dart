import 'package:get/get.dart';
import 'package:griya_rt_app/app/modules/finance/controllers/finance_controller.dart';

import '../controllers/tran_form_controller.dart';

class TranFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinanceController>(
      () => FinanceController(),
    );
  }
}
