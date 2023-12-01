import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';

class ProfileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //TODO: Implement ProfileController
  RxList<UserModel> rxUsers = RxList<UserModel>();
  List<UserModel> get user => rxUsers.value;
  set user(List<UserModel> value) => rxUsers.value = value;

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

  void increment() => count.value++;
}
