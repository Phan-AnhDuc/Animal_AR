import 'package:flutter/material.dart';

class DetailAnimalScreen extends StatefulWidget {
  const DetailAnimalScreen({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.infoAnimal,
  }) : super(key: key);

  final imageUrl;
  final name;
  final infoAnimal;

  @override
  State<DetailAnimalScreen> createState() => _DetailAnimalScreenState();
}

class _DetailAnimalScreenState extends State<DetailAnimalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildImageAnimal(context, widget.imageUrl),
          _buildInfoAnimal(context, widget.name, widget.infoAnimal),
          _buildScanButton(context),
        ],
      ),
    );
  }

  Padding _buildScanButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 150),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff372948),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(color: Color(0xffFF577F), shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/banchan.png",
                scale: 0.5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                "assets/images/scan.png",
                scale: 0.8,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  SingleChildScrollView _buildInfoAnimal(BuildContext context, String name, String infoAnimal) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
        // height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Image.network(widget.imageItems),
            //     Image.network(widget.imageItems),
            //     Image.network(widget.imageItems),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                infoAnimal,
                style: const TextStyle(fontSize: 20),
                maxLines: 8,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 400,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildImageAnimal(BuildContext context, String imageUrl) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: const Color(0xffFFB783),
      child: Center(
        child: Image.network(
          imageUrl,
          scale: 0.5,
        ),
      ),
    );
  }
}
