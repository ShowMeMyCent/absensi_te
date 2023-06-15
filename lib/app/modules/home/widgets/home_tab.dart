import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeTab extends StatelessWidget {
  final authC = Get.find<MainController>();
  final homeC = Get.find<HomeController>();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final RxMap<String, dynamic> userData = RxMap<String, dynamic>({});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authC.loadPersistedUserData().then((_) {
          String userId = authC.auth.currentUser?.uid ?? '';
          return authC.updateUserDataFromFirestore(userId);
        }),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: Get.width,
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
                    Expanded(
                      child: Container(
                        color: Color.fromARGB(255, 244, 244, 244),
                        width: Get.width,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              String formattedTime = DateFormat('HH:mm')
                                  .format(homeC.currentTime.value);
                              return Text(
                                "$formattedTime",
                                style: TextStyle(color: Colors.white),
                              );
                            }),
                            SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        return Text(
                                          "${authC.userData['nama']}"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        );
                                      }),
                                      Obx(() {
                                        return Text(
                                          "${authC.userData['level']} | Hr - Finance",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        );
                                      }),
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
                            SizedBox(
                              height: 15,
                            ),
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: Get.width,
                                height: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 150,
                                          child: Image.asset(
                                              "assets/images/logo_te_long.png"),
                                        ),
                                        Container(
                                          width: 50,
                                          child: Icon(
                                            Icons.notifications,
                                            color: Color(0xfff9a52d),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Text(
                                          "Belum melakukan absensi",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 10),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 70,
                                                      child: Image.asset(
                                                          'assets/icons/absensi.png'),
                                                    ),
                                                    Text(
                                                      'Absensi',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child: Image.asset(
                                                          'assets/icons/pengajuan.png'),
                                                    ),
                                                    Text(
                                                      'Pengajuan',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child: Image.asset(
                                                          'assets/icons/kegiatan.png'),
                                                    ),
                                                    Text(
                                                      'Kegiatan',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child: Image.asset(
                                                          'assets/icons/task.png'),
                                                    ),
                                                    Text(
                                                      'Task',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 70,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            child: Image.asset(
                                                                'assets/icons/info.png'),
                                                          ),
                                                          Text(
                                                            'Info',
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 80,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      child: Image.asset(
                                                          'assets/icons/money.png'),
                                                    ),
                                                    Text(
                                                      'Gaji',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Informasi & Blog",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    // color: Colors.amberAccent,
                                    height: 200,
                                    child: Center(
                                      child: Image.asset(
                                          'assets/images/sites.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
