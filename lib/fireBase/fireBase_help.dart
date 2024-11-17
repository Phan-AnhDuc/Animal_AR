// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getListMail() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("mail");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataListMail = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataListMail.add(mapData);
  }
  return dataListMail;
}
