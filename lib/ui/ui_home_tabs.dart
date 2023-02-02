import 'package:animal_ar/pages/screen_one.dart';
import 'package:animal_ar/pages/screen_two.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'ui_home_main.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final CollectionReference homedata = FirebaseFirestore.instance.collection("homedata");

  var _indexPages = 0;

  final pageOtions = [
    const HomeMain(),
    const ScreenOne(),
    const ScreenTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOtions[_indexPages],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
        child: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white,
          backgroundColor: const Color(0xff372948),
          color: const Color(0xff372948),
          animationCurve: Curves.fastOutSlowIn,
          items: <Widget>[
            Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)), child: Image.asset("assets/images/banchan.png")),
            Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)), child: Image.asset("assets/images/banchan.png")),
            Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)), child: Image.asset("assets/images/banchan.png")),
          ],
          onTap: ((int index) {
            setState(() {
              _indexPages = index;
            });
          }),
        ),
      ),
    );
  }
}