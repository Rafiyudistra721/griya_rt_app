import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:griya_rt_app/app/data/database.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';
import 'package:nb_utils/nb_utils.dart';

class InvenModel {
  String? id;
  String? rtId;
  String? assetName;
  int? quantity;
  String? condition;
  DateTime? time;


  InvenModel ({
    this.id,
    this.rtId,
    this.assetName,
    this.quantity,
    this.condition,
    this.time
  });

  InvenModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return InvenModel(
      id: doc.id,
      rtId: json?['rtId'],
      assetName: json?['assetName'],
      quantity: json?['quantity'],
      condition: json?['condition'],
      time: (json?['time'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> get toJson => {
    'id' : id,
    'rtId' : rtId,
    'assetName' : assetName,
    'quantity' : quantity,
    'condition' : condition,
    'time': time
  };

  Database get db => Database(
    collectionReference: firebaseFirestore
    .collection(rtCollection)
    .doc(rtId)
    .collection(invenCollection), 
    storageReference: firebaseStorage.ref(rtCollection).child(invenCollection));

  Future<InvenModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (id != null) {
      db.edit(toJson);
    }
    return this;
  }

  Future delete() async {
    (id == null) ? toast("Error Invalid ID") : await db.delete(id!);
  }

  Stream<List<InvenModel>> streamList() async* {
    yield* firebaseFirestore
    .collectionGroup(invenCollection)
    .where("id", isNull: true)
    .orderBy("time", descending: true)
    .snapshots()
    .map((query) {
      List<InvenModel> list = [];
      for (var doc in query.docs) {
        list.add(
          InvenModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }

    Stream<List<InvenModel>> streamListFromBook() async* {
    yield* db.collectionReference
        .orderBy("time", descending: true)
        .snapshots()
        .map((query) {
      List<InvenModel> list = [];
      for (var doc in query.docs) {
        list.add(
          InvenModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}