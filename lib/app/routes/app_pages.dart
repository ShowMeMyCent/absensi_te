import 'package:get/get.dart';

import '../modules/add_employee/bindings/add_employee_binding.dart';
import '../modules/add_employee/views/add_employee_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/admin_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mainview/bindings/mainview_binding.dart';
import '../modules/mainview/views/mainview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
      name: _Paths.ADD_EMPLOYEE,
      page: () => AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINVIEW,
      page: () => const MainviewView(),
      binding: MainviewBinding(),
    ),
  ];
}
