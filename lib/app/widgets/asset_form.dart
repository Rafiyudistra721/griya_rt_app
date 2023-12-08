// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/modules/inven/controllers/inven_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class AssetForm extends GetView<InvenController> {
  AssetForm({required this.invenModel});
  InvenModel invenModel = InvenModel();
  GlobalKey<FormState> _form = GlobalKey();

  // AssetForm({super.key});

  @override
  Widget build(BuildContext context) {
    controller.modelToController(invenModel);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.all(10),
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
                            labelStyle: TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                      ),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        isValidationRequired: true,
                        controller: controller.quantityC,
                        decoration: const InputDecoration(
                            labelText: "Jumlah",
                            hintText: "jumlah aset",
                            labelStyle: TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      5.height,
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.conditionC,
                        decoration: const InputDecoration(
                            labelText: "Kondisi",
                            hintText: "kondisi aset",
                            labelStyle: TextStyle(color: colorPrimary, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorPrimary))),
                      ),
                    ],
                  ),
                ),
              ),
              20.height,
              SizedBox(
                width: Get.width,
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
              )
            ],
          ))),
    );
  }
}
