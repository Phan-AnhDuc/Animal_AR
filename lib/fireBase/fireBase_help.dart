import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getTipsData() async {
  CollectionReference modeldata = FirebaseFirestore.instance.collection("tipsDB");
  List<DocumentSnapshot> items = [];
  List<Map<String, dynamic>> dataList = [];

  QuerySnapshot snapshot = await modeldata.get();
  for (var element in snapshot.docs) {
    var mapData = element.data() as Map<String, dynamic>;
    dataList.add(mapData);
    print(mapData);
  }
  return dataList;
}
