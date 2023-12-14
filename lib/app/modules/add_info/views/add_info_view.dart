import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/utils/colors.dart';

import '../controllers/add_info_controller.dart';

class AddInfoView extends GetView<AddInfoController> {
  const AddInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.JudulC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Judul"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.IsiC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Isi"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addInfo(
                  controller.JudulC.text, controller.IsiC.text),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 40),
                backgroundColor: colorPrimary,
              ),
              child: Text(
                'Add Info',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
