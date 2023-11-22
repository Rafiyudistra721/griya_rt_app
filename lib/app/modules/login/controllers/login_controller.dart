import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passC2 = TextEditingController();
  TextEditingController tlpC = TextEditingController();
  TextEditingController provC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController adressC = TextEditingController();
  TextEditingController birthDateC = TextEditingController();

  RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Rx<DateTime?> _selectedDate = DateTime(2000).obs;
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? value) => _selectedDate.value = value;

  handleBirthDate(dynamic context) async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            initialDatePickerMode: DatePickerMode.year,
            firstDate:
                DateTime(selectedDate?.year ?? DateTime.now().year - 100),
            lastDate: DateTime.now()) ??
        selectedDate;
  }

  RxString _selectedGender = ''.obs;
  String get selectedGender => _selectedGender.value;
  set selectedGender(String value) => _selectedGender.value = value;

  void setSelectedGender(String value) {
    _selectedGender = value.obs;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  var _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(value) => _isRegis.value = value;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(value) => _isSaving.value = value;

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
