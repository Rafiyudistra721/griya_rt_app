// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/finance_model.dart';
import 'package:griya_rt_app/app/modules/finance/controllers/finance_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class TranDetail extends GetView<FinanceController> {
  TranDetail({super.key, required this.transaction});
  TransactionModel transaction = TransactionModel();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(transaction);
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      child: Form(
          child: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  AppTextField(
                    textFieldType: TextFieldType.MULTILINE,
                    controller: controller.kegiatanC,
                    readOnly: true,
                    decoration: const InputDecoration(
                        labelText: "Kegiatan",
                        labelStyle: TextStyle(
                          color: colorPrimary,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary))),
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NUMBER,
                    controller: controller.jumlahC,
                    readOnly: true,
                    decoration: const InputDecoration(
                        labelText: "Jumlah",
                        labelStyle: TextStyle(
                          color: colorPrimary,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary))),
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.OTHER,
                    controller: controller.tanggalC,
                    readOnly: true,
                    decoration: const InputDecoration(
                        labelText: "Tanggal",
                        labelStyle: TextStyle(
                          color: colorPrimary,
                          fontSize: 15,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary))),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
