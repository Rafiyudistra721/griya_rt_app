// ignore_for_file: avoid_print, invalid_use_of_protected_member, prefer_final_fields, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class InvenController extends GetxController {

  TextEditingController assetNameC = TextEditingController();
  TextEditingController quantityC = TextEditingController();
  TextEditingController conditionC = TextEditingController();

  modelToController(InvenModel invenModel) {
    assetNameC.text = invenModel.assetName ?? '';
    quantityC.text = invenModel.quantity?.toString() ?? '';
    conditionC.text = invenModel.condition ?? '';
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(InvenModel invenModel) async {
    isSaving = true;
    invenModel.assetName = assetNameC.text;
    invenModel.quantity = int.tryParse(quantityC.text);
    invenModel.condition = conditionC.text;
    if (invenModel.id.isEmptyOrNull) {
      invenModel.time = DateTime.now();
      invenModel.rtId = "ezcwJfC1XKNIEGrTCUNI";
    }

    try {
      await invenModel.save();
      toast("Daftar Aset Telah Diperbarui");
      print("Success");
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future delete(InvenModel invenModel) async {
    if (invenModel.id.isEmptyOrNull) {
      Get.snackbar("Error", "Asset tidak ditemukan");
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
        onConfirm: () async {
          try {
            await invenModel.delete();
            Get.back();
            toast("Aset Telah Dihapus");
          } catch (e) {
            print(e);
          }
        },
        textConfirm: "OK",
        buttonColor: colorPrimary,
        cancelTextColor: colorPrimary,
        radius: 15,
        textCancel: "Batalkan",
        content: const Column(
          children: [
            Text('Apakah anda yakin ingin menghapus data aset?'),

          ],
        ),
        title: "Konfirmasi hapus"
      );
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxList<InvenModel> rxInven = RxList<InvenModel>();
  List<InvenModel> get listInven => rxInven.value;
  set listInven(List<InvenModel> value) => rxInven.value = value;

  @override
  void onInit() {
    rxInven.bindStream(InvenModel().streamList());
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
