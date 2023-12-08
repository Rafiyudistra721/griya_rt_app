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

  WargaModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic>? json = doc.data() as Map<String, dynamic>;
    id = doc.id;
    userId = json['userId'];
    rtId = json['rtId'];
    time = (json['time'] as Timestamp).toDate();
    status = json['status'];
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
          firebaseStorage.ref(rtCollection).child(wargaCollection));

  Future<WargaModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    return this;
  }

  Stream<List<WargaModel>> streamList() async* {
    yield* db.collectionReference
        .orderBy('time', descending: true)
        .snapshots()
        .map((query) {
      List<WargaModel> list = [];
      for (var doc in query.docs) {
        list.add(
          WargaModel.fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }

  Stream<List<WargaModel>> streamAllList() async* {
    yield* firebaseFirestore
        .collectionGroup(wargaCollection)
        .snapshots()
        .map((query) {
      List<WargaModel> list = [];
      for (var doc in query.docs) {
        list.add(
          WargaModel.fromJson(
            doc,
          ),
        );
      }
      print('List length ${list.length}');
      return list;
    });
  }

  Stream<List<WargaModel>> streamListFromRt(String idbook) async* {
    yield* firebaseFirestore
        .collection(rtCollection)
        .doc(idbook)
        .collection(wargaCollection)
        .snapshots()
        .map((query) {
      List<WargaModel> list = [];
      for (var doc in query.docs) {
        print(doc.reference);
        print(doc.data());
        list.add(
          WargaModel.fromJson(
            doc,
          ),
        );
      }
      print('List length ${list.length}');
      return list;
    });
  }
}
