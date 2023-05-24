import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddEmployeeController extends GetxController {
  TextEditingController nipC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController unitC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController notelpC = TextEditingController();

  RxString provinceId = ''.obs;
  RxString cityId = ''.obs;
}
