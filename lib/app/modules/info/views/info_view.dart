import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:griya_rt_app/app/modules/info/controllers/info_controller.dart';
import 'package:griya_rt_app/app/routes/app_pages.dart';
import 'package:griya_rt_app/app/utils/colors.dart';

class InfoView extends StatelessWidget {
  final InfoController infoController = Get.find();
  final Stream<QuerySnapshot> streamData =
      FirebaseFirestore.instance.collection("info").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: streamData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listAllDocs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: listAllDocs.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            "${(listAllDocs[index].data() as Map<String, dynamic>)["Judul"]}",
                          ),
                          subtitle: Text(
                            infoController.truncateSubtitle(
                              "${(listAllDocs[index].data() as Map<String, dynamic>)["isi"]}",
                            ),
                          ),
                          leading: Icon(
                            Icons.image,
                            size: 30,
                          ),
                          dense: true,
                          onTap: () {},
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ADD_INFO),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(350, 40),
              backgroundColor: colorPrimary,
            ),
            child: Text(
              'Add Info',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
