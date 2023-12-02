
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/modules/inven/controllers/inven_controller.dart';

class AssetList extends GetView<InvenController> {
  final int index;
  AssetList({super.key, required this.index, required this.inventory});
  InvenModel inventory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(inventory.assetName ?? ''),
            const Text("|"),
            Text("${inventory.quantity ?? ''}"),
            const Text("|"),
            Text(inventory.condition ?? ''),
          ],
        ),
      ),
    );
  }
}