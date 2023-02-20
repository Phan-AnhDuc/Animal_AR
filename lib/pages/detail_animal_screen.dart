// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:animal_ar/const/ar_card.dart';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_theme.dart';
import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:flutter/material.dart';

class DetailAnimalScreen extends StatefulWidget {
  const DetailAnimalScreen({Key? key, required this.arguments, required this.colors}) : super(key: key);

  final arguments;
  final Color colors;

  @override
  State<DetailAnimalScreen> createState() => _DetailAnimalScreenState();
}

class _DetailAnimalScreenState extends State<DetailAnimalScreen> {
  var plkh;
  @override
  Widget build(BuildContext context) {
    plkh = widget.arguments["plkh"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildImageAnimal(context, widget.arguments, widget.colors),
          _buildInfoAnimal(context, widget.arguments, plkh),
          _buildScanButton(context),
        ],
      ),
    );
  }

  Padding _buildScanButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 120),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color(0xff372948),
              ),
              height: 80,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(color: Color(0xffFF577F), shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/banchan.png",
                scale: 0.6,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                "assets/images/scan.png",
                scale: 1.1,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  SingleChildScrollView _buildInfoAnimal(BuildContext context, var arguments, var plkh) {
    String gioi = plkh["Giới"];
    String bo = plkh["Bộ"];
    String lop = plkh["Lớp"];
    String nganh = plkh["Ngành"];

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: OneColors.black, width: 0.3),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 246, 217, 184),
                Color.fromARGB(255, 247, 190, 190),
              ],
            ),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                arguments["nameAnimal"],
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "( ${arguments["nameAnimalEnglish"]} )",
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Color.fromARGB(255, 148, 149, 152)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    _buildPlkh('Giới'),
                    _buildPlkh('Bộ'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _buildInfoPlkh(gioi),
                    _buildInfoPlkh(bo),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildPlkh('Ngành'),
                    _buildPlkh('Lớp'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _buildInfoPlkh(nganh),
                    _buildInfoPlkh(lop),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OneColors.black, width: 1)),
                child: Text(
                  arguments["infoAnimal"],
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Expanded _buildInfoPlkh(String nganh) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OneColors.black, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                nganh,
                style: OneTheme.of(context).body1.copyWith(color: OneColors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildPlkh(
    String title,
  ) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: OneTheme.of(context).body2.copyWith(color: OneColors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Container _buildImageAnimal(BuildContext context, var arguments, Color colors) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      color: colors,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
            child: CachedImage(
          imageUrl: arguments["imageUrl"],
        )),
      ),
    );
  }
}
