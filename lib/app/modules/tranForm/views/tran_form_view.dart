import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/finance_model.dart';
import 'package:griya_rt_app/app/modules/finance/views/finance_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../finance/controllers/finance_controller.dart';

class TranFormView extends GetView<FinanceController> {
  GlobalKey<FormState> _form = GlobalKey();
  TransactionModel transactionModel = Get.arguments ?? TransactionModel();
  @override
  Widget build(BuildContext context) {
    controller.modelToController(transactionModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF161960),
        title: const Text('Transaksi',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
          child: Obx(
            () => Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (controller.path.value.isNotEmpty)
                          ? Image.file(
                              File(controller.path.value),
                              width: 274,
                              height: 150,
                            )
                          : !transactionModel.images.isEmptyOrNull
                              ? Image.network(
                                  transactionModel.images!,
                                  width: 274,
                                  height: 150,
                                )
                              : Image.asset(
                                  'assets/images/finance.png',
                                  width: 274,
                                  height: 150,
                                ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF161960)),
                        onPressed: () async {
                          await controller.selectImage(ImageSource.gallery);
                          Get.back();
                        },
                        child: Text('Upload', style: TextStyle(color: white)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: controller.kegiatanC,
                          decoration: InputDecoration(labelText: 'Kegiatan'),
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: controller.typeSelected,
                          items:
                              ['Pemasukan', 'Pengeluaran'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.setTipe(newValue);
                          },
                          decoration: InputDecoration(labelText: 'Tipe'),
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controller.jumlahC,
                          decoration: InputDecoration(labelText: 'Jumlah'),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controller.tanggalC,
                          decoration: InputDecoration(labelText: 'Tanggal'),
                          onTap: () async {
                            controller.selectDate(context);
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'This field is required';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF161960),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      if (_form.currentState!.validate() == true) {
                        controller.store(transactionModel);
                      } else {
                        Get.snackbar('Error', 'Data masih kosong');
                      }
                    },
                    child: Text('Submit',
                        style: TextStyle(color: white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
