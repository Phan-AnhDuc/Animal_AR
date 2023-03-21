// ignore_for_file: deprecated_member_use

import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_constant.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:animal_ar/fireBase/fireBase_help.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingImange extends StatefulWidget {
  const TrackingImange({super.key});

  @override
  State<TrackingImange> createState() => _TrackingImangeState();
}

class _TrackingImangeState extends State<TrackingImange> {
  List<Map<String, dynamic>> _trackingImageList = [];
  @override
  void initState() {
    super.initState();
    getTrackingImageData().then((data) {
      setState(() {
        _trackingImageList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
          _buildListTracking(),
        ]),
      ),
    );
  }

  SliverToBoxAdapter _buildListTracking() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: _trackingImageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // số cột trong lưới
            mainAxisSpacing: 20, // khoảng cách giữa các hàng
            crossAxisSpacing: 20, // khoảng cách giữa các cột
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                launch(_trackingImageList[index]['URL']);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: OneColors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(offset: const Offset(0, 1), color: OneColors.textGreyDark.withOpacity(0.3), blurRadius: 5, spreadRadius: 2),
                    ]),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 90,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          child: CachedImage(
                            imageUrl: _trackingImageList[index]["image"],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _trackingImageList[index]["name"],
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '<${_trackingImageList[index]["nameEnglish"]}>',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Container(
                      height: 33,
                      //width: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 190, 190, 190),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(25),
                          topLeft: Radius.circular(5),
                          // bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Image.asset(
                            "assets/images/ar.png",
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.swipe_right,
                            size: 20,
                            color: OneColors.white,
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
