// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print, unnecessary_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

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

  Rx<DateTime?> _selectedDate = DateTime(1800).obs;
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

  var role = "user";

  var currUser = UserModel().obs;
  UserModel get user => currUser.value;
  set user(UserModel value) => currUser.value = value;

  final _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(value) => _isRegis.value = value;

  final _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(value) => _isSaving.value = value;

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  late Rx<User?> firebaseUser;

  login() async {
    try {
      final myUser = await auth.signInWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      if (myUser.user!.emailVerified) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Verifikasi',
          titleStyle: const TextStyle(color: colorPrimary),
          middleText:
              'Verifikasi email anda terlebih dahulu, Apakah verifikasi perlu dikirim ulang?',
          middleTextStyle: const TextStyle(color: colorPrimary),
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
            Get.snackbar(
                'Berhasil', 'Kode verifikasi telah dikirimkan ke email Anda');
          },
          textConfirm: 'Iya',
          textCancel: 'Tidak',
          buttonColor: colorPrimary,
          confirmTextColor: Colors.white,
          cancelTextColor: colorPrimary,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast('Tidak ada user untuk email ini');
      } else if (e.code == 'wrong-password') {
        toast('Password salah untuk email ini');
      } else {
        toast(e.message);
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  signup() async {
    try {
      isSaving = true;
      UserModel user = UserModel(
        username: nameC.text,
        email: emailC.text,
        telephone: int.tryParse(tlpC.text),
        adress: adressC.text,
        birthDate: selectedDate,
        gender: selectedGender,
        image: '',
        time: DateTime.now(),
      );
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailC.text,
        password: passC.text,
      );
      await myUser.user!.sendEmailVerification();
      user.id = myUser.user!.uid;
      if (user.id != null) {
        firebaseFirestore
            .collection(usersCollection)
            .doc(user.id)
            .set(user.toJson)
            .then((value) {
          Get.defaultDialog(
              title: "Verifikasi Email",
              middleText: "Kami telah mengirimkan verifikasi ke Email anda",
              textConfirm: "Oke",
              onConfirm: () {
                nameC.clear();
                passC.clear();
                emailC.clear();
                passC2.clear();
                Get.back();
                isRegis = false;
              },
              buttonColor: colorPrimary,
              cancelTextColor: colorPrimary,
              confirmTextColor: Colors.white,
              titleStyle: const TextStyle(color: colorPrimary),
              middleTextStyle: const TextStyle(color: colorPrimary));
        });
      }
      isSaving = false;
    } on FirebaseAuthException catch (e) {
      isSaving = false;
      if (e.code == 'weak-password') {
        toast('Password terlalu lemah');
      } else if (e.code == 'email-already-in-use') {
        toast('Akun sudah ada untuk email ini');
      } else {
        toast(e.message);
      }
    }
  }

  logout() async {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Anda yakin ingin keluar?',
      onConfirm: () async {
        await FirebaseAuth.instance.signOut();
        Get.back();
        isSaving = false;
        emailC.clear();
        passC.clear();
        Get.offAndToNamed(Routes.LOGIN);
      },
      textConfirm: 'Iya',
      textCancel: 'Tidak',
      buttonColor: colorPrimary,
      confirmTextColor: Colors.white,
      cancelTextColor: colorPrimary,
      titleStyle: const TextStyle(color: colorPrimary),
      middleTextStyle: const TextStyle(color: colorPrimary),
    );
  }

  resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      await auth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
          title: 'Reset Password',
          middleText: 'Berhasil mengirim link reset password ke $email',
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: 'Oke',
          buttonColor: colorPrimary,
          cancelTextColor: colorPrimary,
          confirmTextColor: Colors.white,
          titleStyle: const TextStyle(color: colorPrimary),
          middleTextStyle: const TextStyle(color: colorPrimary));
    } else {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Email yang anda kirim tidak valid',
          textConfirm: 'Oke',
          onConfirm: () => Get.back(),
          buttonColor: colorPrimary,
          cancelTextColor: colorPrimary,
          confirmTextColor: Colors.white,
          titleStyle: const TextStyle(color: colorPrimary),
          middleTextStyle: const TextStyle(color: colorPrimary));
    }
  }

  StreamUser(User? fuser) {
    if (fuser != null) {
      currUser.bindStream(UserModel().streamList(fuser.uid));
      print('auth id = ' + fuser.uid);
    } else {
      print('null auth');
      user = UserModel();
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, StreamUser);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailC.clear();
    passC.clear();
    passC2.clear();
    nameC.clear();
  }

  void increment() => count.value++;
}
