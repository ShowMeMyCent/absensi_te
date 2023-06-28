import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/auth_controller.dart';

class EmployeeTab extends StatelessWidget {
  final authC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllUserDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllUserDocs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                    '${(listAllUserDocs[index].data() as Map<String, dynamic>)['nama']}'
                        .toUpperCase(),
                  ),
                  subtitle: Text(
                      '${(listAllUserDocs[index].data() as Map<String, dynamic>)['email']}'),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
