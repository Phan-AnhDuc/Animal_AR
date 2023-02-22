// ignore_for_file: unused_local_variable, avoid_print, unrelated_type_equality_checks, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_list_color.dart';
import 'package:animal_ar/const/ar_theme.dart';

import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:animal_ar/pages/detail_animal_screen.dart';
import 'package:animal_ar/search/ui_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({
    Key? key,
    required this.id,
  }) : super(key: key);

  final id;

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final CollectionReference data =
      FirebaseFirestore.instance.collection("animalDB");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFCACA),
      body: Scrollbar(
        child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              _buildHeader(context),
              _buildListAnimal(context, widget.id),
            ]),
      ),
    );
  }

  SliverToBoxAdapter _buildListAnimal(BuildContext context, int id) {
    Random random = Random();
    return SliverToBoxAdapter(
        child: Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: StreamBuilder(
                stream: data.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {}
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          id == 1
                              ? Column(
                                  children: [
                                    _buildNoidung('Động vật ăn cỏ'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "anco")),
                                    const SizedBox(height: 20),
                                    _buildNoidung('Động vật ăn thịt'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "anthit")),
                                  ],
                                )
                              : const SizedBox(),
                          id == 2
                              ? Column(
                                  children: [
                                    _buildNoidung('Động vật sống ở nước mặn'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _buildListView(
                                            snapshot, "nuocman")),
                                    //const SizedBox(height: 10),
                                    _buildNoidung('Động vật sống ở nước ngọt'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: _buildListView(
                                            snapshot, "nuocngot")),
                                  ],
                                )
                              : const SizedBox(),
                          id == 3
                              ? Column(
                                  children: [
                                    _buildNoidung('Gia súc'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "giasuc")),
                                    // const SizedBox(height: 10),
                                    _buildNoidung('Gia cầm'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "giacam")),
                                  ],
                                )
                              : const SizedBox(),
                          id == 4
                              ? Column(
                                  children: [
                                    _buildNoidung('Động vật ăn cỏ'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "anco")),
                                    const SizedBox(height: 10),
                                    _buildNoidung('Động vật ăn cỏ'),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child:
                                            _buildListView(snapshot, "anthit")),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  }
                  return Container();
                })),
      ],
    ));
  }

  ListView _buildListView(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, String idName) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: snapshot.data?.docs.length,
        itemBuilder: (context, index) {
          final DocumentSnapshot records = snapshot.data!.docs[index];
          Random random = Random();
          var indexRandom = random.nextInt(ColorRamdom.animalColor.length);
          String idname = records["idName"];
          int iD = records["id"];
          return (idname == idName && iD == widget.id)
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailAnimalScreen(
                                  arguments: records,
                                  colors: ColorRamdom.animalColor[indexRandom],
                                )));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.36,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                color: ColorRamdom.animalColor[indexRandom],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 90),
                                child: Container(
                                  height: 115,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 10)
                                      ],
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff95BDFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xffBAD7E9),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Text(
                                                  records["nameAnimal"] ?? "",
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            records["infoAnimal"] ?? "",
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: 100,
                                  child: CachedImage(
                                      imageUrl: records["imageUrl"]),
                                )),
                          ],
                        )
                        // Text(name ?? ""),
                        // Text(infoAnimal ?? ""),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        });
  }

  Container _buildNoidung(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffB4E4FF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 212, 207, 207),
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
        child: Text(
          title,
          style: OneTheme.of(context)
              .body1
              .copyWith(color: OneColors.black, fontSize: 15),
        ),
      ),
    );
  }

  SliverPersistentHeader _buildHeader(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 6,
                child: SearchBar(), // SizedBox(
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
