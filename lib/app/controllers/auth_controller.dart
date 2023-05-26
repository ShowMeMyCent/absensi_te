import 'dart:async';

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
    String email,
    String password,
    String notelp,
    String level,
    String kota,
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
          final users = <String, String>{
            "nip": nip,
            "nama": nama,
            "email": email,
            "password": password,
            "notelp": notelp,
            "level": level,
            "kota": kota,
          };
          await db.collection("users").doc(myUser.user!.uid).set(users).onError(
                (e, _) => Get.snackbar('Error', 'Gagal Memasukkan data'),
              );
          await myUser.user!.sendEmailVerification();
          Get.back();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            Get.snackbar('weak-password', 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            Get.snackbar('email-already-in-use',
                'The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      },
      textCancel: 'CANCEL',
    );
  }

  login(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Email Verified',
          middleText: 'Didnt get the email? click yes',
          confirmTextColor: Colors.white,
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
        Get.snackbar('user-not-found', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar(
            'wrong-password', 'Wrong password provided for that user.');
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
