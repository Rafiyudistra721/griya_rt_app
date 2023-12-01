import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:griya_rt_app/app/data/database.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';


class UserModel {
  String? id;
  String? username;
  String? email;
  String? image;
  int? telephone;
  String? adress;
  DateTime? birthDate;
  String? gender;
  DateTime? time;
  bool? isAdmin = false;

  UserModel ({
    this.id,
    this.username,
    this.email,
    this.image,
    this.telephone,
    this.adress,
    this.birthDate,
    this.gender,
    this.time,
  });

  UserModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return UserModel(
      id: doc.id,
      username: json?['username'],
      email: json?['email'],
      image: json?['image'],
      telephone: json?['telephone'],
      adress: json?['adress'],
      birthDate: (json?['birthDate'] as Timestamp?)?.toDate(),
      gender: json?['gender'],
      time : (json?['time'] as Timestamp?)?.toDate(),
    );
  }
  Map<String, dynamic> get toJson => {
    'id' : id,
    'username' : username,
    'email' : email,
    'image' : image,
    'telephone' : telephone,
    'adress' : adress,
    'birthDate' : birthDate,
    'gender' : gender,
    'time' : time,
  };

  Database db =  Database(
    collectionReference: firebaseFirestore.collection(
      usersCollection,
    ), 
    storageReference: firebaseStorage.ref(usersCollection));

  Future<UserModel> save({File? file}) async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (file != null && id != null) {
      image = await db.upload(id: id!, file: file);
      db.edit(toJson);
    }
    return this;
  }

  Stream<UserModel> streamList(String id) async* {
    yield* db.collectionReference.doc(id).snapshots().map((event) {
      print("event id = ${event.id}");
      return fromJson(event);
    });
  }

  Stream<List<UserModel>> allstreamList() async* {
    yield* db.collectionReference.snapshots().map((query) {
      List<UserModel> list = [];
      for (var doc in query.docs) {
        list.add(
          UserModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}