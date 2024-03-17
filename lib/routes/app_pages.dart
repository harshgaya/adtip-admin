import 'package:adtip_admin_panel/authentication/bindings/login_bindings.dart';
import 'package:adtip_admin_panel/authentication/pages/login_screen.dart';
import 'package:adtip_admin_panel/dashboard/pages/dashboard_screen.dart';
import 'package:get/get.dart';

import '../dashboard/bindings/dashboard_bindings.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashBoardScreen(),
      binding: DashboardBindings(),
    ),
  ];
}
