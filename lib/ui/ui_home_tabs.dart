import 'package:animal_ar/pages/screen_two.dart';
import 'package:animal_ar/ui/ui_home_tracking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'ui_home_nature.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final CollectionReference homedata = FirebaseFirestore.instance.collection("homedata");

  var _indexPages = 0;

  final pageOtions = [
    const HomeNature(),
    const TrackingImange(),
    const ScreenKnown(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOtions[_indexPages],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(),
        child: CurvedNavigationBar(
          buttonBackgroundColor: Colors.transparent,
          backgroundColor: const Color(0xffD4EDF9),
          color: const Color(0xffA084DC),
          animationCurve: Curves.easeOutSine,
          items: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Image.asset("assets/images/paw.png"),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Image.asset("assets/images/ar3.png"),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Image.asset("assets/images/evolution.png"),
            ),
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
