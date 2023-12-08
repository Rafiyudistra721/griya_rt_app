import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/finance_model.dart';

class TranFormController extends GetxController {
  TextEditingController kegiatanC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? typeSelected;

  modelToController(TransactionModel transactionModel) {
    kegiatanC.text = transactionModel.activity ?? '';
    jumlahC.text = transactionModel.amount?.toString() ?? '';
    tanggalC.text = transactionModel.date?.toString() ?? '';
    typeSelected = transactionModel.type;
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
    }
  }

  void setTipe(String? newValue) {
    typeSelected = newValue;
  }

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
