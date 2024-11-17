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

Future<void> addMailData(String address, String password) async {
  CollectionReference mailCollection = FirebaseFirestore.instance.collection("mail");
  try {
    await mailCollection.add({
      'address': address,
      'password': password,
    });
  } catch (e) {}
}

Future<List<Map<String, dynamic>>> getListIdMail() async {
  CollectionReference mailCollection = FirebaseFirestore.instance.collection("mail");
  List<Map<String, dynamic>> dataListMail = [];

  try {
    QuerySnapshot snapshot = await mailCollection.get();

    for (var element in snapshot.docs) {
      var mapData = element.data() as Map<String, dynamic>;
      mapData['id'] = element.id;
      dataListMail.add(mapData);
    }
  } catch (e) {}
  return dataListMail;
}

Future<void> deleteMailData(String documentId) async {
  CollectionReference mailCollection = FirebaseFirestore.instance.collection("mail");

  try {
    await mailCollection.doc(documentId).delete();
    print('Xóa tài khoản thành công!');
  } catch (e) {
    print('Lỗi khi xóa tài khoản: $e');
  }
}
