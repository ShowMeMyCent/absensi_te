import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absensi_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  const AbsensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard Absensi"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    height: Get.height / 6,
                    width: Get.width,
                  ),
                  Expanded(
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 230, 10),
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  "Mahendra Sahla Rizky",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/seed/picsum/200/300"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: Get.width / 3.5,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 18),
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${controller.dt.day} - ${controller.dt.month} - ${controller.dt.year}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: Get.width / 3.5,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 18),
                                    Text(
                                      "Entry Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${controller.dt.hour}:${controller.dt.minute}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: Get.width / 3.5,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 18),
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Present",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.amber,
                            fixedSize: Size(Get.width, 50),
                          ),
                          onPressed: () {},
                          child: Text("Apply for attendance"),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          width: Get.width, height: 10, child: Text("halo")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
