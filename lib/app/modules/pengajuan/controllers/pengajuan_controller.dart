import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanController extends GetxController {
  var selectedJenis = "".obs;
  TextEditingController valDate = TextEditingController();
  TextEditingController valKeterangan = TextEditingController();

  onChangeJenis(var jenis) {
    selectedJenis.value = jenis;
  }
}
