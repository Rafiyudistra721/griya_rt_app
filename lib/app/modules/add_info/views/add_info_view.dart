import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_info_controller.dart';

class AddInfoView extends GetView<AddInfoController> {
  const AddInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddInfoView'),
          centerTitle: true,
        ),
        body: Column(
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
              onPressed: () =>
                  controller.add(
                    controller.JudulC.text, 
                    controller.IsiC.text
                    ),
              child: Text("Submit"),
            ),
          ],
        ));
  }
}
