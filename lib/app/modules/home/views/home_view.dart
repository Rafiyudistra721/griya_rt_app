import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // HomeView({Key? key}) : super(key: key);

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    // TODO: Implement your logic here
    if (index == 1) {
      // Get.to(() => ProfileView());
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
                        'image/logo1.png',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'image/info.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Informasi',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   height: 260,
              //   child: Obx(
              //     () => controller.books.length < 1
              //         ? Center(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   "No Information",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ],
              //             ),
              //           )
              //         : SingleChildScrollView(
              //             scrollDirection: Axis.vertical,
              //             child: ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.vertical,
              //               itemCount: controller.books.length,
              //               physics: ScrollPhysics(),
              //               itemBuilder: (context, index) => BookCard(
              //                 book: controller.books[index],
              //               ),
              //             ),
              //           ),
              //   ),
              // ),
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
                              right: 7.0, left: 7.0, top: 5),
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
                                  // Navigate to the corresponding page
                                  // Use Get.to(() => YourPage()) for navigation using GetX library
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'image/inventaris.png',
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
                                  // Navigate to the corresponding page
                                  // Use Get.to(() => YourPage()) for navigation using GetX library
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'image/warga.png',
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
                                  Get.to(() => KeuanganView());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'image/keuangan.png',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 50),
          // painter: BNBCustomPainter(),
          child: Container(
            height: 50,
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
        ),
      ),
    );
  }
}

// class BookCard extends GetView<HomeController> {
//   BookCard({required this.book});
//   Book book;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         padding: EdgeInsets.all(10),
//         width: 160,
//         height: 260,
//         margin: EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               book.image != null
//                   ? Container(
//                       height: 80,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: NetworkImage(book.image!),
//                               fit: BoxFit.cover)),
//                     )
//                   : Container(
//                       height: 80,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: DecorationImage(
//                               image: AssetImage("assets/default.png"),
//                               fit: BoxFit.fitHeight)),
//                     ),
//               SizedBox(
//                 height: 15,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Text(
//                   book.title!,
//                   style: TextStyle(color: Colors.blue, fontSize: 18),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Text(
//                   book.category!,
//                   style: TextStyle(color: Colors.blue, fontSize: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Text(
//                   "${book.page} pages",
//                   style: TextStyle(color: Colors.blue, fontSize: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 NumberFormat.percentPattern('id')
//                     .format((book.readpage ?? 0) / (book.page ?? 0)),
//                 style: TextStyle(color: Colors.blue),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: LinearProgressIndicator(
//                   color: Colors.blue,
//                   value: (book.readpage ?? 0) / (book.page ?? 0),
//                   minHeight: 10,
//                   backgroundColor: Colors.grey[400],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
