import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';
import 'package:griya_rt_app/app/widgets/tran_list.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
//     hide BoxDecoration, BoxShadow;
import '../controllers/finance_controller.dart';

class FinanceView extends GetView<FinanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF161960),
        title: const Text('Halaman Keuangan',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: Column(
                children: [
                  //KAS
                  Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kas Total',
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.info_outline,
                                      color: Color(0XFF161960),
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.print,
                                      color: Color(0XFF161960),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/finance.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(87, 158, 158, 158),
                          thickness: 1.0,
                        ),
                        const Text(
                          'Saldo',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          'Rp 10.000,00',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  //TRANSAKSI
                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Transaksi',
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.TRAN_FORM);
                                    },
                                    icon: const Icon(
                                        Icons.add_circle_outline_rounded,
                                        color: Color(0XFF161960)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Obx(() {
                          if (controller.finance.isEmpty) {
                            return const Expanded(
                              child: Center(
                                child: Text(
                                  'Belum ada transaksi',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: controller.finance.length,
                                itemBuilder: (context, index) {
                                  return TranList(
                                    index: index, 
                                    transactionModel: controller.finance[index]);
                                },
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  // void TransactionDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Center(child: Text('Transaksi')),
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextFormField(
  //               controller: controller.kegiatanC,
  //               decoration: InputDecoration(labelText: 'Kegiatan'),
  //               onChanged: (value) {},
  //             ),
  //             TextFormField(
  //               controller: controller.pengeluaranC,
  //               decoration: InputDecoration(labelText: 'Pengeluaran'),
  //               onChanged: (value) {},
  //             ),
  //             TextFormField(
  //               controller: controller.tanggalC,
  //               decoration: InputDecoration(labelText: 'Tanggal Transaksi'),
  //               onTap: () async {
  //                 controller.selectDate(context);
  //               },
  //             ),
  //             SizedBox(height: 30),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                       side: BorderSide(color: Color(0XFF161960)),
  //                       fixedSize: Size(110, 35)),
  //                   child: Text(
  //                     'Cancel',
  //                     style: TextStyle(color: Color(0XFF161960)),
  //                   ),
  //                 ),
  //                 SizedBox(width: 16),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                       backgroundColor: Color(0XFF161960),
  //                       fixedSize: Size(110, 35)),
  //                   child: Text(
  //                     'Submit',
  //                     style: TextStyle(color: white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

