import 'package:cloud_firestore/cloud_firestore.dart';

class Informasi {
  final String id;
  final String judul;
  final String isi;


  Informasi({required this.id, required this.judul, required this.isi});

  factory Informasi.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Informasi(
      id: doc.id,
      judul: data['judul'] ?? '',
      isi: data['isi'] ?? '',
    );
  }
}