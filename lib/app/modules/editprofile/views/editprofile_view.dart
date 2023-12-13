import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/modules/login/controllers/login_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../data/Models/user_model.dart';
import '../../../routes/app_pages.dart';

class EditprofileView extends GetView<LoginController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  // final UserModel user = Get.arguments as UserModel;
  UserModel userModel = UserModel();

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
    controller.modelToController(userModel);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
        ),
        title: const Text('Edit Profile'),
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
            child: Obx(() => Form(
                key: form,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      textFieldType: TextFieldType.NAME,
                      controller: controller.nameC,
                      decoration: const InputDecoration(labelText: 'Nama'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      controller: controller.emailC,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        // Tambahkan validasi email jika diperlukan
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.birthDateC,
                      decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal lahir tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      controller: controller.tlpC,
                      decoration: const InputDecoration(labelText: 'No.Telp'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomer telephone tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      textFieldType: TextFieldType.MULTILINE,
                      controller: controller.adressC,
                      decoration: const InputDecoration(labelText: 'Alamat'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: controller.isSaving
                          ? null
                          : () {
                            if (form.currentState!.validate()) {
                              controller.store(userModel);
                            }
                          },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: colorPrimary,
                        fixedSize: const Size(200, 50),
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
