import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    letterSpacing: 20,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 320,
                  child: Lottie.asset('assets/lottie/login_animation.json'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          labelText: 'NIP',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        autocorrect: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          labelText: 'Password',
                          suffixIcon: Obx(
                            () {
                              return IconButton(
                                onPressed: () {
                                  controller.isHidden.toggle();
                                },
                                icon: Icon((controller.isHidden.value == true)
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove),
                              );
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff2B2D76),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
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
    );
  }
}
