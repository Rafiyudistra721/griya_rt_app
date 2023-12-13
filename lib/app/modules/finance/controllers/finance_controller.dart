// ignore_for_file: invalid_use_of_protected_member, prefer_final_fields, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/finance_model.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:image_picker/image_picker.dart';

class FinanceController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController kegiatanC = TextEditingController();
  TextEditingController jumlahC = TextEditingController();
  TextEditingController tanggalC = TextEditingController();
  String? typeSelected;

  final ImagePicker picker = ImagePicker();
  var path = ''.obs;

  Future selectImage(ImageSource source) async {
    XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile is XFile) {
      path.value = xfile.path;
    }
  }

  modelToController(TransactionModel transactionModel) {
    kegiatanC.text = transactionModel.activity ?? '';
    jumlahC.text = transactionModel.amount?.toString() ?? '';
    tanggalC.text = transactionModel.date is DateTime
            ? DateFormat("EEEE, dd MMMM y").format(transactionModel.date!)
            : "";
    typeSelected = transactionModel.type;
    path.value = transactionModel.images ?? '';
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Rx<DateTime?> _selectedDate = DateTime(2000).obs;
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? value) => _selectedDate.value = value;

  selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      tanggalC.text = DateFormat('EEE, dd - MM - y').format(pickedDate);
    }
  }

  void setTipe(String? newValue) {
    typeSelected = newValue;
  }

  Future store(TransactionModel transactionModel, {String? path}) async {
    isSaving = true;
    transactionModel.activity = kegiatanC.text;
    transactionModel.amount = int.tryParse(jumlahC.text);
    transactionModel.type = typeSelected;
    transactionModel.date = DateTime.now();
    if (transactionModel.id.isEmptyOrNull) {
      transactionModel.date = DateTime.now();
      transactionModel.rtId = "ezcwJfC1XKNIEGrTCUNI";
    }

    try {
      await transactionModel.save();
      toast("Transaksi Telah Ditambahkan");
      print("Success");
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  RxList<TransactionModel> rxFinance = RxList<TransactionModel>();
  List<TransactionModel> get finance => rxFinance.value;
  set listInven(List<TransactionModel> value) => rxFinance.value = value;

  @override
  void onInit() {
    rxFinance.bindStream(TransactionModel().streamList());
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
