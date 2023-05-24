import 'dart:convert';

import 'package:absensi_te/app/data/models/province_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/auth_controller.dart';
import '../../../data/models/city_model.dart';
import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Color.fromARGB(255, 244, 244, 244),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 2,
              child: Container(
                height: Get.height,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Add New Employee',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          /// Text field untuk NIP
                          TextField(
                            controller: controller.nipC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'NIP',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Nama
                          TextField(
                            controller: controller.nameC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Nama',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Unit
                          // TextField(
                          //   controller: controller.unitC,
                          //   autocorrect: false,
                          //   textInputAction: TextInputAction.next,
                          //   decoration: InputDecoration(
                          //     contentPadding:
                          //         EdgeInsets.symmetric(horizontal: 30),
                          //     labelText: 'Unit',
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),

                          /// Text field untuk Email
                          TextField(
                            controller: controller.emailC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Password
                          TextField(
                            controller: controller.passC,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk No telpon
                          TextField(
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              labelText: 'No Telepon',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Provinsi

                          DropdownSearch<Province>(
                            showSearchBox: true,
                            popupItemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text('${item.name}'),
                            ),
                            dropdownSearchDecoration: InputDecoration(
                              labelText: 'Provinsi',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onFind: (text) async {
                              var response = await Dio().get(
                                ('https://api.goapi.id/v1/regional/provinsi?api_key=s72bn1UaCwjAe00gXGX1EvUySqwAr6'),
                              );
                              return Province.fromJsonList(
                                  response.data['data']);
                            },
                            onChanged: (value) =>
                                controller.provinceId.value = value?.id ?? '0',
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// Text field untuk Provinsi

                          DropdownSearch<City>(
                            showSearchBox: true,
                            popupItemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text('${item.name}'),
                            ),
                            dropdownSearchDecoration: InputDecoration(
                              labelText: 'Kota',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onFind: (text) async {
                              var response = await Dio().get(
                                ('https://api.goapi.id/v1/regional/kota?provinsi_id=${controller.provinceId}&api_key=s72bn1UaCwjAe00gXGX1EvUySqwAr6'),
                              );
                              return City.fromJsonList(response.data['data']);
                            },
                            onChanged: (value) => print(value?.toJson()),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                authC.signup(
                                  controller.nipC.text,
                                  controller.nameC.text,
                                  controller.unitC.text,
                                  controller.emailC.text,
                                  controller.passC.text,
                                  controller.notelpC.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfff9a52d),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text('SUBMIT'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
