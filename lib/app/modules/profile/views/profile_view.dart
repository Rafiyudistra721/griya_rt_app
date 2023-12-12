import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
// import '../../editprofile/controllers/editprofile_controller.dart';
import '../../home/views/home_view.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ProfileView extends GetView<ProfileController> {
  // final EditprofileController editProfileController =
  //     Get.put(EditprofileController());
  final authC = Get.find<LoginController>();
  UserModel user = Get.arguments ?? UserModel();

  ProfileView({Key? key}) : super(key: key);
  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  void _onItemTapped(int index) {
    // TODO: Implement your logic here
    if (index == 0) {
      Get.to(() => HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgLR.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20, height: 200),
                    Stack(
                      children: [
                        image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xFF161960),
                                // backgroundImage: AssetImage(''),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              padding: EdgeInsets.only(bottom: 2),
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0xFF161960),
                              ),
                              onPressed: () async {
                                await getImage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${authC.user.username}'.toUpperCase(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${authC.user.email}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    Padding(
                      padding: EdgeInsets.only(right: 300),
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Color(0xFF161960),
                        ),
                        onPressed: () {
                          // Get.toNamed(Routes.EDITPROFILE, arguments: user);
                          //     ?.then((edit) {
                          //   if (edit != null && edit is UserModel) {
                          //     controller.update();
                          //   }
                          // });
                          Get.toNamed(Routes.EDITPROFILE, arguments: user);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xFF161960),
                                size: 40,
                              ),
                              SizedBox(width: 23),
                              Text(
                                '${authC.user.username}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.email,
                                color: Color(0xFF161960),
                                size: 40,
                              ),
                              SizedBox(width: 23),
                              Text(
                                '${authC.user.email}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 33.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cake,
                                color: Color(0xFF161960),
                                size: 40,
                              ),
                              SizedBox(width: 23),
                              Text(
                                authC.user.birthDate is DateTime
                                    ? DateFormat("EEE, dd MMM y")
                                        .format(authC.selectedDate!)
                                    : '--',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Color(0xFF161960),
                                size: 40,
                              ),
                              SizedBox(width: 23),
                              Text(
                                '${authC.user.telephone}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Color(0xFF161960),
                                size: 40,
                              ),
                              SizedBox(width: 23),
                              Text(
                                '${authC.user.adress}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xFF161960),
                          size: 40,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () => authC.logout(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 50),
          // painter: BNBCustomPainter(),
          child: Container(
            color: Colors.white,
            height: 100,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, size: 30),
                  color: Color.fromARGB(255, 106, 104, 104),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.person, size: 30),
                  color: Color(0xFF161960),
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

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset((size.width / 2), size.height), 25, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
