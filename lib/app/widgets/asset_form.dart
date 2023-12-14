// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/modules/inven/controllers/inven_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class AssetForm extends GetView<InvenController> {
  AssetForm({super.key, required this.invenModel});
  InvenModel invenModel = InvenModel();
  GlobalKey<FormState> _form = GlobalKey();


  @override
  Widget build(BuildContext context) {
    controller.modelToController(invenModel);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(15),
      child: Obx(() => Form(
          key: _form,
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.assetNameC,
                        decoration: const InputDecoration(
                            labelText: "Nama Aset",
                            hintText: "nama aset",
                            labelStyle:
                                TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        isValidationRequired: true,
                        controller: controller.quantityC,
                        decoration: const InputDecoration(
                            labelText: "Jumlah",
                            hintText: "jumlah aset",
                            labelStyle:
                                TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.conditionC,
                        decoration: const InputDecoration(
                            labelText: "Kondisi",
                            hintText: "kondisi aset",
                            labelStyle:
                                TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      10.height
                    ],
                  ),
                ),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 116,
                    child: FloatingActionButton.extended(
                        backgroundColor: Colors.white,
                        onPressed: () => Get.back(),
                        label: const Text(
                          "Kembali",
                          style: TextStyle(color: colorPrimary),
                        )),
                  ),
                  5.width,
                  SizedBox(
                    width: 116,
                    child: FloatingActionButton.extended(
                        backgroundColor: colorPrimary,
                        onPressed: controller.isSaving
                            ? null
                            : () {
                                if (_form.currentState!.validate()) {
                                  controller.store(invenModel);
                                }
                              },
                        label: controller.isSaving
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Simpan",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
