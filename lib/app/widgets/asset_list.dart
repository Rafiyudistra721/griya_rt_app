// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/modules/inven/controllers/inven_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:griya_rt_app/app/widgets/asset_form.dart';
import 'package:nb_utils/nb_utils.dart';

class AssetList extends GetView<InvenController> {
  final int index;
  AssetList({super.key, required this.index, required this.inventory});
  InvenModel inventory;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 5, right: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  inventory.assetName ?? '',
                  style: const TextStyle(color: black),
                  overflow: TextOverflow.clip,
                ),
                const Text("|"),
                Text("${inventory.quantity ?? ''}",
                    style: const TextStyle(color: black)),
                const Text("|"),
                Text(inventory.condition ?? '',
                    style: const TextStyle(color: black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        contentPadding: EdgeInsets.zero,
                        barrierDismissible: true,
                        content: AssetForm(invenModel: inventory),
                        title: "Edit Aset",
                        titleStyle: const TextStyle(
                          fontSize: 20,
                          color: colorPrimary,
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, size: 21)),
                Text("|"),
                IconButton(
                    onPressed: () {
                      controller.delete(inventory);
                    },
                    icon: Icon(Icons.delete, size: 21))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
