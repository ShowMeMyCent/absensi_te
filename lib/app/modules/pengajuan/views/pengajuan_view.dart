import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pengajuan_controller.dart';

class PengajuanView extends GetView<PengajuanController> {
  const PengajuanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 106, 187, 254),
                Color.fromARGB(251, 1, 109, 197),
              ],
            ),
          ),
        ),
        title: const Text('Pengajuan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "Pilih jenis pengajuan",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            activeColor: Colors.blue,
                            fillColor: MaterialStateProperty.all(Colors.blue),
                            value: "cuti",
                            groupValue: controller.selectedJenis.value,
                            onChanged: (value) {
                              controller.onChangeJenis(value);
                              print(controller.selectedJenis.value);
                            },
                          ),
                        ),
                        Text(
                          "Cuti",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            activeColor: Colors.blue,
                            fillColor: MaterialStateProperty.all(Colors.blue),
                            value: "izin",
                            groupValue: controller.selectedJenis.value,
                            onChanged: (value) {
                              controller.onChangeJenis(value);
                              print(controller.selectedJenis.value);
                            },
                          ),
                        ),
                        Text(
                          "Izin",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            activeColor: Colors.blue,
                            fillColor: MaterialStateProperty.all(Colors.blue),
                            value: "perjalanan dinas",
                            groupValue: controller.selectedJenis.value,
                            onChanged: (value) {
                              controller.onChangeJenis(value);
                              print(controller.selectedJenis.value);
                            },
                          ),
                        ),
                        Text(
                          "Perjalanan Dinas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  Container(
                    child: TextField(
                      controller: controller.valDate,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: "Masukkan Tanggal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2040),
                        );
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(formattedDate);
                          controller.valDate.text = formattedDate;
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      controller: controller.valKeterangan,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Keterangan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          print(controller.selectedJenis.value);
                          print(controller.valDate.text);
                          print(controller.valKeterangan.text);
                        },
                        child: Text("Ajukan ${controller.selectedJenis.value}"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
