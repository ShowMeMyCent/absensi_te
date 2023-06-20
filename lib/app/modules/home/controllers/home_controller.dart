import 'package:absensi_te/app/modules/home/widgets/employee_app_bar.dart';
import 'package:absensi_te/app/modules/home/widgets/his_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  var tabIndex = 0;

  Rx<DateTime> currentTime = DateTime.now().obs;

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

  @override
  void onInit() {
    super.onInit();
    // Update the time every second
    updateClock();
  }

  void updateClock() {
    Future.delayed(Duration(seconds: 1), () {
      currentTime.value = DateTime.now();
      updateClock();
    });
  }
}
