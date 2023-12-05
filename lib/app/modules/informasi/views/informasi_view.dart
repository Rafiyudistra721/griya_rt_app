import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';

class InformasiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, Index) => Card(
            child: ListTile(
              title: Text('Judul'),
              subtitle: Text('Isi'),
              leading: Icon(
                Icons.image,
                size: 30,
              ),
              dense: true,
              onTap: () {},
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_INFO),
        child: Text('add'),
      ),
    );
  }
}
