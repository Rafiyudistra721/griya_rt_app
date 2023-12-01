import 'package:get/get.dart';

import '../modules/finance/bindings/finance_binding.dart';
import '../modules/finance/views/finance_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/tranForm/bindings/tran_form_binding.dart';
import '../modules/tranForm/views/tran_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FINANCE,
      page: () => FinanceView(),
      binding: FinanceBinding(),
    ),
    GetPage(
      name: _Paths.TRAN_FORM,
      page: () => const TranFormView(),
      binding: TranFormBinding(),
    ),
  ];
}
