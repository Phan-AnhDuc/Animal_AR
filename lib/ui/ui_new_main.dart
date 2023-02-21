import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/pages/screen_two.dart';
import 'package:flutter/material.dart';

class ScreenNews extends StatefulWidget {
  const ScreenNews({super.key});

  @override
  State<ScreenNews> createState() => _ScreenNewsState();
}

class _ScreenNewsState extends State<ScreenNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
          _buildListEvolution(context),
        ]),
      ),
    );
  }

  SliverToBoxAdapter _buildListEvolution(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ScreenKnown();
                }));
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OneColors.bHA),
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: OneColors.bHD),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OneColors.bHA),
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: OneColors.bHD),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OneColors.bHA),
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: OneColors.bHD),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OneColors.bHA),
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
