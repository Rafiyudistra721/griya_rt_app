import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:griya_rt_app/app/data/database.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';

class WargaModel {
  String? id;
  String? userId;
  String? rtId;
  DateTime? time;
  String? status;

  WargaModel({this.id, this.userId, this.rtId, this.time, this.status});

  WargaModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return WargaModel(
      id: doc.id,
      userId: json?['userId'],
      rtId: json?['rtrId'],
      time: (json?['time'] as Timestamp).toDate(),
      status: json?['status'],
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'userId': userId,
        'rtId': rtId,
        'time': time,
        'status': status,
      };

  Database get db => Database(
      collectionReference: firebaseFirestore
          .collection(rtCollection)
          .doc(rtId)
          .collection(wargaCollection),
      storageReference:
          firebaseStorage.ref(usersCollection).child(wargaCollection));

  Future<WargaModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

}
