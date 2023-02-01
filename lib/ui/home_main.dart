import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final CollectionReference data = FirebaseFirestore.instance.collection("animalDB");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app test"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
              stream: data.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(child: CircularProgressIndicator(color: Colors.blue));
                }
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 10 / 12,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot records = snapshot.data!.docs[index];
                      print(records["nameAnimal"]);
                      String? name = records["nameAnimal"];
                      String? infoAnimal = records["infoAnimal"];
                      String? imageUrl = records["imageUrl"];
                      return Container(
                        margin: const EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0, right: 1),
                                  child: Container(
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        color: Colors.pink),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 90),
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
                                          border: Border.all(color: Colors.white, width: 3),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              name ?? "",
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              infoAnimal ?? "",
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                      height: 100,
                                      child: Image.network(imageUrl ?? ""),
                                    )),
                              ],
                            )
                            // Text(name ?? ""),
                            // Text(infoAnimal ?? ""),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator(color: Colors.blue));
              },
            ),
          )
        ],
      ),
    );
  }
}
