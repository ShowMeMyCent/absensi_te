import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/auth_controller.dart';

class AccountTab extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Container(
                  height: Get.height / 3.5,
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/seed/picsum/200/300"),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child:
                                    Icon(Icons.camera) // change this children
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'USERNAME',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.person),
                              ),
                              title: Text('No Pegawai'),
                              subtitle: Text('012345678'),
                            ),
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.account_tree),
                              ),
                              title: Text('Unit'),
                              subtitle: Text('HR - Finance'),
                            ),
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.email),
                              ),
                              title: Text('Email'),
                              subtitle: Text('user@gmail.com'),
                            ),
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.phone),
                              ),
                              title: Text('No Telepon'),
                              subtitle: Text('081234567'),
                            ),
                            ListTile(
                              leading: Container(
                                height: double.infinity,
                                child: Icon(Icons.home),
                              ),
                              title: Text('Alamat'),
                              subtitle: Text('Tangerang'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          authC.logout();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('LOGOUT'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Container(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Activity',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 200,
                                child: Lottie.asset(
                                    'assets/lottie/activities_animation.json'),
                              ),
                            ),
                          ],
                        ),
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
