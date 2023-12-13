// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/finance_model.dart';
import 'package:griya_rt_app/app/modules/finance/controllers/finance_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:griya_rt_app/app/widgets/tran_detail.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class TranList extends GetView<FinanceController> {
  final int index;
  TranList({super.key, required this.index, required this.transactionModel});
  TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.defaultDialog(
        contentPadding: EdgeInsets.zero,
        textCancel: "Kembali",
        barrierDismissible: false,
        content: TranDetail(transaction: transactionModel),
        title: "Detail Transaksi",
        titleStyle: const TextStyle(fontSize: 20, color: colorPrimary),
      ),
      child: Card(
        color: white,
        surfaceTintColor: white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transactionModel.activity ?? 'Kegiatan',
                  style: const TextStyle(fontSize: 18)),
              Text(
                DateFormat("EEEE, dd MMMM y").format(transactionModel.date!),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
