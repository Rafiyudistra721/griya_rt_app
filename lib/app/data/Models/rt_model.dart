import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:griya_rt_app/app/data/database.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';

class RTModel {
  String? id;
  String? rtUsername;
  String? rtEmail;
  int? rtTelephone;
  String? rtAddress;
  String? rtImage;

  RTModel(
      {this.id,
      this.rtUsername,
      this.rtEmail,
      this.rtTelephone,
      this.rtAddress,
      this.rtImage});

  RTModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return RTModel(
        id: doc.id,
        rtUsername: json?['rtUsername'],
        rtEmail: json?['rtEmail'],
        rtTelephone: json?['rtTelephone'],
        rtAddress: json?['rtAddress'],
        rtImage: json?['rtImage']);
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'rtUsername': rtUsername,
        'rtEmail': rtEmail,
        'rtTelephone': rtTelephone,
        'rtAddress': rtAddress,
        'rtImage': rtImage
      };

  Database db = Database(
      collectionReference: firebaseFirestore.collection(rtCollection),
      storageReference: firebaseStorage.ref(rtCollection));

  Stream<List<RTModel>> streamList() async* {
    yield* db.collectionReference.snapshots().map((query) {
      List<RTModel> list = [];
      for (var doc in query.docs) {
        list.add(
          RTModel().fromJson(doc),
        );
      }
      return list;
    });
  }
}
