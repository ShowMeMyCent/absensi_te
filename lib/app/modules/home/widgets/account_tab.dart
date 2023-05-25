import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class AccountTab extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final homeC = Get.find<HomeController>();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          } else {
            final user = snapshot.data;
            final uid = user?.uid;
            CollectionReference users =
                FirebaseFirestore.instance.collection('users');
            return FutureBuilder(
              future: users.doc(uid).get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return SingleChildScrollView(
                    child: Stack(
                      children: [
                        SizedBox(
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
                                              child: Icon(Icons
                                                  .camera) // change this children
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '${data['nama']}'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Container(
                                              height: double.infinity,
                                              child: Icon(Icons.person),
                                            ),
                                            title: Text('No Pegawai'),
                                            subtitle: Text('${data['nip']}'),
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
                                            subtitle: Text('${data['email']}'),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              height: double.infinity,
                                              child: Icon(Icons.phone),
                                            ),
                                            title: Text('No Telepon'),
                                            subtitle: Text('${data['notelp']}'),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              height: double.infinity,
                                              child: Icon(Icons.home),
                                            ),
                                            title: Text('Alamat'),
                                            subtitle: Text('${data['kota']}'),
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
                                              borderRadius:
                                                  BorderRadius.circular(50))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('LOGOUT'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.logout),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    child: Container(
                                      width: Get.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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

                return Text("loading");
              },
            );
          }
        });
  }
}
