import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class AddInfoController extends GetxController {
  late TextEditingController JudulC;
  late TextEditingController IsiC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void add(String Judul, String Isi) async {
    CollectionReference info = firestore.collection("info");

    try {
      await info.add({
        "Judul": Judul,
        "isi": Isi,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan Informasi",
        onConfirm: () => Get.back(),
        textConfirm: "Oke",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan!",
        middleText: "Tidak Berhasil menambahkan Informasi",
      );
    }
  }

  @override
  void onInit() {
    JudulC = TextEditingController();
    IsiC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    JudulC.dispose();
    IsiC.dispose();
    super.onClose();
  }
}
