import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:griya_rt_app/app/data/Models/warga_model.dart';
import 'package:griya_rt_app/app/modules/login/controllers/login_controller.dart';
import 'package:griya_rt_app/app/utils/colors.dart';

import '../controllers/warga_controller.dart';

class WargaView extends GetView<WargaController> {
  // final authC = Get.find<LoginController>();
  const WargaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorPrimary,
        title: const Text(
          'Halaman Warga',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        // centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
        child: Obx(
          () => controller.listwarga.isEmpty
              ? const Center(
                  child: Text(
                    'Data Tidak Ditemukan',
                    style: TextStyle(color: colorPrimary),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.listwarga.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          title: Text(
                            '${controller.listuser.firstWhere((element) => element.id == controller.listwarga[index].userId).username}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          subtitle: Text(
                            '${controller.listwarga[index].status}',
                            style: const TextStyle(fontSize: 13),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      title: const Center(
                                        child: Text(
                                          'Undang Warga',
                                          style: TextStyle(
                                              color: colorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text:
                                                  'Apakah anda yakin ingin mengubah user ini menjadi warga?\n\n',
                                              style: TextStyle(
                                                color: colorSecondary,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'User : ${controller.listuser.firstWhere((element) => element.id == controller.listwarga[index].userId).username}',
                                              style: const TextStyle(
                                                  color: colorPrimary,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 5,
                                                shadowColor: colorPrimary,
                                                backgroundColor: colorPrimary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                minimumSize:
                                                    const Size(100, 40),
                                              ),
                                              onPressed: () async {
                                                await controller.approve(
                                                    controller
                                                        .listwarga[index]);
                                              },
                                              child: const Text(
                                                'Approve',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 3,
                                                shadowColor: colorPrimary,
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: colorPrimary),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                minimumSize:
                                                    const Size(100, 40),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: colorPrimary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Image.asset(
                              controller.listwarga[index].status == 'approve'
                                  ? 'assets/icons/approve.png'
                                  : 'assets/icons/pending.png',
                              fit: BoxFit.contain,
                              width: 40,
                              height: 50,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
