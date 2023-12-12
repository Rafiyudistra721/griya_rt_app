import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../data/Models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  // final UserModel user = Get.arguments as UserModel;

  EditprofileView({Key? key}) : super(key: key);

  File? image;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    controller.modelToController(UserModel());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: form,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: controller.nameC,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: controller.emailC,
                    decoration: InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email wajib disi';
                      }
                      // Tambahkan validasi email jika diperlukan
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.birthDateC,
                    decoration: InputDecoration(
                        labelText: 'Tanggal Lahir',
                        prefixIcon: Icon(Icons.calendar_today)),
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (selectedDate != null) {
                        // Format tanggal yang dipilih sesuai kebutuhan
                        String formattedDate =
                            DateFormat("EEE, dd MMM y").format(selectedDate);
                        controller.birthDateC.text = formattedDate;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal lahir wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: controller.tlpC,
                    decoration: InputDecoration(
                        labelText: 'No.Telp', prefixIcon: Icon(Icons.phone)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomer telephone wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: controller.adressC,
                    decoration: InputDecoration(
                        labelText: 'Alamat',
                        prefixIcon: Icon(Icons.location_on)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat wajib diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      if (form.currentState!.validate()) {
                        // Panggil fungsi updateProfileData jika validasi sukses
                        await controller.isSaving;
                      }
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
          ),
        ],
      ),
    );
  }
}
