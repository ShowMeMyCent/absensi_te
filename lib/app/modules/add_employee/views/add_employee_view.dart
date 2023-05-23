import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Employee'),
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
                child: SingleChildScrollView(
                  child: Column(
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
                            // TextField(
                            //   autocorrect: false,
                            //   textInputAction: TextInputAction.next,
                            //   decoration: InputDecoration(
                            //     contentPadding:
                            //         EdgeInsets.symmetric(horizontal: 30),
                            //     labelText: 'NIP',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),

                            /// Text field untuk Nama
                            // TextField(
                            //   autocorrect: false,
                            //   textInputAction: TextInputAction.next,
                            //   decoration: InputDecoration(
                            //     contentPadding:
                            //         EdgeInsets.symmetric(horizontal: 30),
                            //     labelText: 'Nama',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),

                            /// Text field untuk Unit
                            // TextField(
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
                            SizedBox(
                              height: 20,
                            ),

                            /// Text field untuk Email
                            TextField(
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
                            // TextField(
                            //   autocorrect: false,
                            //   textInputAction: TextInputAction.next,
                            //   decoration: InputDecoration(
                            //     contentPadding:
                            //         EdgeInsets.symmetric(horizontal: 30),
                            //     labelText: 'No Telepon',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),

                            /// Text field untuk Alamat
                            // TextField(
                            //   autocorrect: false,
                            //   textInputAction: TextInputAction.next,
                            //   decoration: InputDecoration(
                            //     contentPadding:
                            //         EdgeInsets.symmetric(horizontal: 30),
                            //     labelText: 'Alamat',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
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
          ),
        ],
      ),
    );
  }
}
