import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // HomeView({Key? key}) : super(key: key);

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    if (index == 1) {
      Get.to(() => ProfileView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F7),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFF8F7F7),
          child: Stack(
            children: [
              Container(
                height: 380,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1E2395), Color(0xFFC5DFF8)],
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/logo_home.png',
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Selamat Datang',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text('Di ',
                                  style: TextStyle(color: Colors.white)),
                              Text('Aplikasi Griya RT!',
                                  style: TextStyle(
                                      color: Color(0xFF161960),
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Griya Shanta',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Aplikasi Sistem Informasi dan Manajemen RT',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 447,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => InformasiView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/info.png',
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Informasi',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF161960),
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 490,
                child: Obx(
                  () => controller.informasi.length < 1
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tidak Ada Informasi",
                                style: TextStyle(color: Color(0xFF161960)),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 290,
                            width: 380,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                              itemCount: max(2, 3),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    leading:
                                        Image.asset('image/image.info.png'),
                                    title: Text('Kegiatan 17 Agustus'),
                                    subtitle: Text(
                                      'Kegiatan 17 Agustus yang diselenggarakan oleh warga',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ),
              Positioned(
                top: 275,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Container(
                    width: 377,
                    height: 159,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 7.0, left: 7.0, top: 12.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Nama Pengurus',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF161960),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, top: 2),
                              child: Divider(
                                color: Colors.grey,
                                height: 36,
                              )),
                        ),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => InvenView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/inventaris.png',
                                        width: 45,
                                        height: 45,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Inventaris',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 106, 106, 106),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WargaView());
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/info.png',
                                      width: 45,
                                      height: 45,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Warga',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                            255, 106, 106, 106),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => FinanceView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/keuangan.png',
                                        width: 45,
                                        height: 45,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Keuangan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromARGB(
                                              255, 106, 106, 106),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, size: 30),
              color: Color(0xFF161960),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.person, size: 30),
              color: Color.fromARGB(255, 106, 104, 104),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
