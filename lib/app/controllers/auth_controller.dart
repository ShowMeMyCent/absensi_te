import 'package:absensi_te/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(
    String nip,
    String nama,
    String unit,
    String email,
    String password,
    String notelp,
    String alamat,
  ) async {
    Get.defaultDialog(
      title: 'CREATE USER',
      middleText: 'Confirm create user',
      confirmTextColor: Colors.white,
      textConfirm: 'SUBMIT',
      onConfirm: () async {
        try {
          UserCredential myUser =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          await myUser.user!.sendEmailVerification();
          Get.back();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            Get.defaultDialog(
              title: 'weak-password',
              middleText: 'The password provided is too weak.',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () => Get.back(),
            );
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            Get.defaultDialog(
              title: 'email-already-in-use',
              middleText: 'The account already exists for that email.',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () => Get.back(),
            );
          }
        } catch (e) {
          print(e);
        }
      },
      textCancel: 'CANCEL',
      onCancel: () => Get.back(),
    );
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(myUser);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Email Verified',
          middleText: 'Didnt get the email? click yes',
          textConfirm: 'yes',
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textCancel: 'no',
          onCancel: () {
            Get.back();
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: 'user-not-found',
          middleText: 'No user found for that email.',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: 'wrong-password',
          middleText: 'Wrong password provided for that user.',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
