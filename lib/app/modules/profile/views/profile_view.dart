import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
// import '../../editprofile/controllers/editprofile_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ProfileView extends GetView<ProfileController> {
  // final EditprofileController editProfileController =
  //     Get.put(EditprofileController());
  final authC = Get.find<LoginController>();
  // UserModel user = Get.arguments ?? UserModel();

  ProfileView({Key? key}) : super(key: key);
  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
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
                      padding: EdgeInsets.all(5),
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
                          Get.toNamed(
                            Routes.EDITPROFILE,
                          );
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
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        style: TabStyle.reactCircle,
        color: Color(0xFF161960),
        activeColor: Color(0xFF161960),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) {
            // Get.toNamed(Routes.HOME);
          } else if (index == 1) {
            Get.toNamed(Routes.PROFILE);
          }
        },
        initialActiveIndex: 1,
      ),
    );
  }
}
