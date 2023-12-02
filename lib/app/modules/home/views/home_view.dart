import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/modules/login/controllers/login_controller.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';

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
      body: Column(
        children: [
          Center(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => authC.logout(),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Center(
        child: IconButton(
          onPressed: () {
            Get.toNamed(Routes.INVEN);
          }, 
          icon: const Icon(Icons.add)))
        ],
      ),
    );
  }
}
