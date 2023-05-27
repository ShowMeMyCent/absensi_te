import 'package:absensi_te/app/controllers/auth_controller.dart';
import 'package:absensi_te/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          String initialRoute;

          if (snapshot.data != null) {
            // User is authenticated, retrieve user level from Firestore
            FirebaseFirestore.instance
                .collection('users')
                .doc(snapshot.data!.uid)
                .get()
                .then((doc) {
              if (doc.exists) {
                String userLevel = doc.data()?['level'];

                if (userLevel == 'admin') {
                  initialRoute = Routes.ADMIN;
                } else {
                  initialRoute = Routes.HOME;
                }
              } else {
                // User document does not exist
                initialRoute = Routes.LOGIN;
              }

              // Navigate to the initial route
              Get.offNamed(initialRoute);
            });
          } else {
            // User is not authenticated, set initial route to login
            initialRoute = Routes.LOGIN;

            // Navigate to the initial route
            Get.offNamed(initialRoute);
          }
          return FutureBuilder(
              future: Future.delayed(Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot)
                  return GetMaterialApp(
                    title: "Application",
                    debugShowCheckedModeBanner: false,
                    initialRoute: AppPages.INITIAL,
                    getPages: AppPages.routes,
                  );
              });
        }
        return SplashscreenView();
      },
    );
  }
}
