import 'package:absensi_te/app/modules/home/widgets/employee_app_bar.dart';
import 'package:absensi_te/app/modules/home/widgets/his_app_bar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  bottomTabBar() {
    if (tabIndex == 1) {
      return HisTabBar();
    } else if (tabIndex == 3) {
      return EmployeeAppBar();
    }
  }
}
