import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:nb_utils/nb_utils.dart';

class EditprofileController extends GetxController {
  // RxBool isDataChanged = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController adressC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();

  // Future<void> updateProfileData(UserModel user) async {
  //   try {
  //     String Id = "I9o8R38G8fWfumOaAruBpPP7UKk1";
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');
  //     DocumentReference userDoc = users.doc(Id);

  //     // Update data user pada Firestore
  //     await userDoc.update({
  //       'username': nameC.text,
  //       'email': emailC.text,
  //       'telephone': tlpC.text,
  //       'adress': adressC.text,
  //       // Tambahkan kolom-kolom data lainnya sesuai kebutuhan
  //     });

  //     Get.snackbar('Success', 'Profile updated successfully');
  //   } catch (error) {
  //     // Tangani kesalahan jika terjadi
  //     print('Error updating profile: $error');
  //     Get.snackbar('Error', 'Failed to update profile');
  //   }
  // }

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
  modelToController(UserModel userModel) {
    nameC.text = userModel.username ?? '';
    nameC.text = userModel.username ?? '';
    tlpC.text = userModel.telephone?.toString() ?? '';
    adressC.text = userModel.adress ?? '';
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(UserModel userModel) async {
    isSaving = true;
    userModel.username = nameC.text;
    userModel.email = emailC.text;
    userModel.telephone = int.tryParse(tlpC.text);
    userModel.adress = adressC.text;
    if (userModel.id.isEmptyOrNull) {
      userModel.time = DateTime.now();
    }

    try {
      await userModel.save();
      toast("Daftar Aset Telah Diperbarui");
      print("Success");
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  RxList<UserModel> rxUser = RxList<UserModel>();
  List<UserModel> get listUser => rxUser.value;
  set listInven(List<UserModel> value) => rxUser.value = value;

  final count = 0.obs;
  @override
  void onInit() {
    //  rxUser.bindStream(UserModel().streamList());
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
