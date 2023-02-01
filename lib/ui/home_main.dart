import 'dart:math';

import 'package:animal_ar/pages/detail_animal_screen.dart';
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
      backgroundColor: const Color(0xffFFCACA),
      body: CustomScrollView(slivers: [
        _buildHeader(context),
        _buildListAnimal(context),
      ]),
    );
  }

  SliverToBoxAdapter _buildListAnimal(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.9,
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
                        childAspectRatio: 10 / 13,
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
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimalScreen(argument: records)));
                          },
                          child: Container(
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
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  maxLines: 4,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  infoAnimal ?? "",
                                                  maxLines: 4,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.justify,
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
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: Colors.blue));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  SliverPersistentHeader _buildHeader(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 24),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      //add prefix icon
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      fillColor: Colors.white,

                      hintText: "Search",

                      //make hint text
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),

                      //lable style
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        minHeight: MediaQuery.of(context).padding.top + 70,
        maxHeight: MediaQuery.of(context).padding.top + 70,
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
