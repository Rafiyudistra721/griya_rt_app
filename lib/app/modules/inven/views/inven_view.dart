import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/inven_model.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:griya_rt_app/app/widgets/asset_form.dart';
import 'package:griya_rt_app/app/widgets/asset_list.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/inven_controller.dart';

class InvenView extends GetView<InvenController> {
  const InvenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorPrimary,
          title: const Text(
            'Halaman Inventaris',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/icons/icon_note.png",
                        )),
                    const Text(
                      "Daftar Aset",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    150.width,
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            backgroundColor: Colors.white,
                            contentPadding: EdgeInsets.zero,
                            barrierDismissible: false,
                            content: SizedBox(
                              height: 345,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                  child: Column(
                                children: [
                                  AssetForm(
                                    invenModel: InvenModel(),
                                  ),
                                ],
                              )),
                            ),
                            title: "Tambah Aset",
                            titleStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_circle_outline))
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nama Aset"),
                    Text("|"),
                    Text("Jumlah"),
                    Text("|"),
                    Text("Kondisi")
                  ],
                ),
                15.height,
                Obx(() {
                  if (controller.listInven.isEmpty) {
                    return Container(
                        height: 100,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text("Belum ada aset yang ditambahkan"),
                        ));
                  } else {
                    return SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          clipBehavior: Clip.antiAlias,
                          itemCount: controller.listInven.length,
                          itemBuilder: (context, index) {
                            return AssetList(
                              index: index,
                              inventory: controller.listInven[index],
                            );
                          }),
                    );
                  }
                })
              ],
            ),
          ),
        ));
  }
}
