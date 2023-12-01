import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  EditprofileView({Key? key}) : super(key: key);
  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.toNamed(
              Routes.PROFILE,
            );
          },
        ),
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgLR.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller.nameC,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: controller.emailC,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: controller.tlpC,
                  decoration: InputDecoration(labelText: 'No.Telp'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: controller.adressC,
                  decoration: InputDecoration(labelText: 'Alamat'),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk menyimpan perubahan
                    // controller.saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF161960),
                    fixedSize: Size(200, 50),
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
