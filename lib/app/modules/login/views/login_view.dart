import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:griya_rt_app/app/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  GlobalKey<FormState> formKey = GlobalKey();
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorThird,
      body: Stack(
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
          SingleChildScrollView(
              child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/logo_login.png',
                      width: 250,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            //USERNAME
                            10.height,
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: colorPrimary,
                                    ),
                                    10.width,
                                    SizedBox(
                                      height: 60,
                                      width: 230,
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: colorPrimary,
                                        controller: controller.nameC,
                                        autocorrect: false,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          labelText: 'Username',
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Username wajib diisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            5.height,
                            //EMAIL
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: colorPrimary,
                                  ),
                                  10.width,
                                  SizedBox(
                                    height: 60,
                                    width: 230,
                                    child: TextFormField(
                                      showCursor: true,
                                      cursorColor: colorPrimary,
                                      controller: controller.emailC,
                                      autocorrect: false,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        labelText: 'Email',
                                        labelStyle:
                                            TextStyle(color: colorPrimary),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email wajib diisi';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.height,
                            //PASSWORD
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.lock_outline,
                                    color: colorPrimary,
                                  ),
                                  10.width,
                                  SizedBox(
                                    height: 60,
                                    width: 230,
                                    child: TextFormField(
                                      showCursor: true,
                                      cursorColor: colorPrimary,
                                      controller: controller.passC,
                                      autocorrect: false,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText:
                                          controller.isPasswordHidden.value,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(
                                            color: colorPrimary),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .togglePasswordVisibility();
                                          },
                                          icon: controller
                                                  .isPasswordHidden.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                        border: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Harap isi password Anda';
                                        }
                                        if (controller.isRegis &&
                                            value != controller.passC2.text) {
                                          return 'Kata sandi tidak cocok';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.height,
                            //PASSWORD CORRECT
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.lock_outline,
                                    color: colorPrimary,
                                  ),
                                  10.width,
                                  SizedBox(
                                    height: 60,
                                    width: 230,
                                    child: TextFormField(
                                      showCursor: true,
                                      cursorColor: colorPrimary,
                                      controller: controller.passC2,
                                      autocorrect: false,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText:
                                          controller.isPasswordHidden.value,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 10, bottom: 5),
                                        labelText: 'Konfirmasi Password',
                                        labelStyle: const TextStyle(
                                            color: colorPrimary),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .togglePasswordVisibility();
                                          },
                                          icon: controller
                                                  .isPasswordHidden.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                        border: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: colorPrimary),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Harap isi password Anda';
                                        }
                                        if (controller.isRegis &&
                                            value != controller.passC.text) {
                                          return 'Kata sandi tidak cocok';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.height,
                            //TELEPON
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.phone_android_sharp,
                                      color: colorPrimary,
                                    ),
                                    10.width,
                                    SizedBox(
                                      height: 60,
                                      width: 230,
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: colorPrimary,
                                        controller: controller.tlpC,
                                        autocorrect: false,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          labelText: 'No Tlp',
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'No Tlp wajib diisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            5.height,
                            //PROVINSI
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_city,
                                      color: colorPrimary,
                                    ),
                                    10.width,
                                    SizedBox(
                                      height: 60,
                                      width: 230,
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: colorPrimary,
                                        controller: controller.provC,
                                        autocorrect: false,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          labelText: 'Provinsi',
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Provinsi wajib diisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            5.height,
                            //KOTA
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.business_outlined,
                                      color: colorPrimary,
                                    ),
                                    10.width,
                                    SizedBox(
                                      height: 60,
                                      width: 230,
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: colorPrimary,
                                        controller: controller.cityC,
                                        autocorrect: false,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          labelText: 'Kota',
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Kota wajib diisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            5.height,
                            //ALAMAT
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: colorPrimary,
                                    ),
                                    10.width,
                                    SizedBox(
                                      height: 60,
                                      width: 230,
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: colorPrimary,
                                        controller: controller.adressC,
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        textInputAction: TextInputAction.next,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          labelText: 'Alamat',
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: colorPrimary),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Alamat wajib diisi';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            // BIRTH DATE
                            if (controller.isRegis)
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      alignment: Alignment.centerLeft,
                                      child: const Icon(
                                        Icons.calendar_today,
                                        color: colorPrimary,
                                      ),
                                    ),
                                    10.height,
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: SizedBox(
                                        height: 60,
                                        width: 220,
                                        child: ListTile(
                                          onTap: () async => await controller
                                              .handleBirthDate(context),
                                          title: const Text(
                                            "Birth Date",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: colorPrimary),
                                          ),
                                          subtitle: Text(
                                            controller.selectedDate is DateTime
                                                ? DateFormat("EEE, dd MMM y")
                                                    .format(controller
                                                        .selectedDate!)
                                                : '--',
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            5.height,
                            if (controller.isRegis)
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: colorPrimary,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'male',
                                          groupValue: controller.selectedGender,
                                          onChanged: (value) {
                                            controller.selectedGender =
                                                value ?? '';
                                          },
                                          activeColor: colorPrimary,
                                        ),
                                        Text('male'),
                                        Radio<String>(
                                          value: 'female',
                                          groupValue: controller.selectedGender,
                                          onChanged: (value) {
                                            controller.selectedGender =
                                                value ?? '';
                                          },
                                          activeColor: colorPrimary,
                                        ),
                                        Text('female'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //BUTTON
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shadowColor: Colors.grey,
                      backgroundColor: colorPrimary,
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text(
                      controller.isRegis ? 'Daftar' : 'Masuk',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      controller.isRegis = !controller.isRegis;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        controller.isRegis
                            ? 'Sudah Punya Akun? Login Disini'
                            : 'Belum Punya Akun? Daftar Disini',
                        style: TextStyle(
                            color: colorPrimary, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          controller.isRegis ? '' : 'Lupa Password',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}