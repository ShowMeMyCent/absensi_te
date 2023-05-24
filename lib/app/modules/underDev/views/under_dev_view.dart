import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/under_dev_controller.dart';

class UnderDevView extends GetView<UnderDevController> {
  const UnderDevView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        title: const Text('UnderDevView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnderDevView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
