import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:griya_rt_app/app/data/Models/user_model.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
// import '../../editprofile/controllers/editprofile_controller.dart';
import '../../home/views/home_view.dart';
import '../../login/controllers/login_controller.dart';
// import '../controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ProfileView extends GetView<LoginController> {
  // final EditprofileController editProfileController =
  //     Get.put(EditprofileController());
  // final authC = Get.find<LoginController>();
  // UserModel user = Get.arguments ?? UserModel();

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
                    const SizedBox(width: 20, height: 200),
                    Stack(
                      children: [
                        image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : const CircleAvatar(
                                radius: 30,
                                backgroundColor: colorPrimary,
                                // backgroundImage: AssetImage(''),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              padding: const EdgeInsets.only(bottom: 2),
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: colorPrimary,
                              ),
                              onPressed: () async {
                                await getImage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.user.username}'.toUpperCase(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${controller.user.email}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: colorPrimary,
                        ),
                        onPressed: () {
                          // Get.toNamed(Routes.EDITPROFILE, arguments: user);
                          //     ?.then((edit) {
                          //   if (edit != null && edit is UserModel) {
                          //     controller.update();
                          //   }
                          // });
                          Get.toNamed(Routes.EDITPROFILE, arguments: controller.user);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                              const Icon(
                                Icons.person,
                                color: colorPrimary,
                                size: 40,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                '${controller.user.username}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.email,
                                color: colorPrimary,
                                size: 40,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                '${controller.user.email}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 33.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.cake,
                                color: colorPrimary,
                                size: 40,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                controller.user.birthDate is DateTime
                                    ? DateFormat("EEE, dd MMM y")
                                        .format(controller.user.birthDate!)
                                    : '--',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone_android,
                                color: colorPrimary,
                                size: 40,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                '${controller.user.telephone}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: colorPrimary,
                                size: 40,
                              ),
                              const SizedBox(width: 23),
                              Text(
                                '${controller.user.adress}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: colorPrimary,
                          size: 40,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () => controller.logout(),
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
        shape: const CircularNotchedRectangle(),
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
                  icon: const Icon(Icons.home, size: 30),
                  color: const Color.fromARGB(255, 106, 104, 104),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(Icons.person, size: 30),
                  color: colorPrimary,
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
