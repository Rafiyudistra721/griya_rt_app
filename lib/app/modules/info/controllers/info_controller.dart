import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference info = firestore.collection("info");

    return info.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference info = firestore.collection("info");
    return info.snapshots();
  }

    // Fungsi untuk memotong subtitle
  String truncateSubtitle(String subtitle) {
    const int maxSubtitleLength = 20;
    return subtitle.length <= maxSubtitleLength
        ? subtitle
        : subtitle.substring(0, maxSubtitleLength) + '...';
  }
}
