import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/modules/login/controllers/login_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => authC.logout(),
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
