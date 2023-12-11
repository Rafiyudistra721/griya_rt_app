import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';

class EditprofileController extends GetxController {
  RxBool isDataChanged = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController adressC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();

  Future<void> updateProfileData(UserModel user) async {
    try {
      String Id = "I9o8R38G8fWfumOaAruBpPP7UKk1";
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDoc = users.doc(Id);

      // Update data user pada Firestore
      await userDoc.update({
        'username': nameC.text,
        'email': emailC.text,
        'telephone': tlpC.text,
        'adress': adressC.text,
        // Tambahkan kolom-kolom data lainnya sesuai kebutuhan
      });

      Get.snackbar('Success', 'Profile updated successfully');
    } catch (error) {
      // Tangani kesalahan jika terjadi
      print('Error updating profile: $error');
      Get.snackbar('Error', 'Failed to update profile');
    }
  }

  // Future<void> saveChanges(String userId) async {
  //   try {
  //     CollectionReference users = firestore.collection('users');
  //     DocumentReference userDoc = users.doc(userId);

  //     // Update data user pada Firestore
  //     await userDoc.update({
  //       'Username': nameC.text,
  //       'email': emailC.text,
  //       'Tanggal lahir': birthDateC.text,
  //       'telephone': tlpC.text,
  //       'adress': adressC.text,
  //       // Tambahkan kolom-kolom data lainnya sesuai kebutuhan
  //     });

  //     Get.snackbar('Success', 'Profile updated successfully');
  //   } catch (error) {
  //     print('Error updating profile: $error');
  //     Get.snackbar('Error', 'Failed to update profile');
  //   }
  // }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
