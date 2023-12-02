import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            Get.toNamed(Routes.INVEN);
          }, 
          icon: const Icon(Icons.add))
      ),
    );
  }
}
