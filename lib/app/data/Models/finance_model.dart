import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:griya_rt_app/app/data/database.dart';
import 'package:griya_rt_app/app/integrations/firestore.dart';
import 'package:nb_utils/nb_utils.dart';

class TransactionModel {
  String? id;
  String? rtId;
  String? activity;
  String? type;
  int? amount;
  String? images;
  DateTime? date;

  TransactionModel(
      {this.id,
      this.rtId,
      this.activity,
      this.type,
      this.amount,
      this.images,
      this.date});

  TransactionModel fromJson(DocumentSnapshot doc) {
    var json = doc.data() as Map<String, dynamic>?;
    return TransactionModel(
      id: doc.id,
      rtId: json?['rtId'],
      activity: json?['activity'],
      type: json?['type'],
      amount: json?['amount'],
      images: json?['images'],
      date: (json?['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'rtId': rtId,
        'activity': activity,
        'type': type,
        'amount': amount,
        'images': images,
        'date': date
      };

  Database get db => Database(
      collectionReference: firebaseFirestore
          .collection(rtCollection)
          .doc(rtId)
          .collection(financeCollection),
      storageReference:
          firebaseStorage.ref(rtCollection).child(financeCollection));

  Future<TransactionModel> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (id != null) {
      db.edit(toJson);
    }
    return this;
  }

  Stream<List<TransactionModel>> streamList() async* {
    yield* firebaseFirestore
        .collectionGroup(financeCollection)
        .orderBy("time", descending: true)
        .snapshots()
        .map((query) {
      List<TransactionModel> list = [];
      for (var doc in query.docs) {
        list.add(
          TransactionModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }

  Stream<List<TransactionModel>> streamListFromBook() async* {
    yield* db.collectionReference
        .orderBy("time", descending: true)
        .snapshots()
        .map((query) {
      List<TransactionModel> list = [];
      for (var doc in query.docs) {
        list.add(
          TransactionModel().fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
