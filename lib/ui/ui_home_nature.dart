import 'package:animal_ar/const/ar_card.dart';

import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/pages/screen_tips.dart';

import 'package:animal_ar/ui/ui_home_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNature extends StatefulWidget {
  const HomeNature({super.key});

  @override
  State<HomeNature> createState() => _HomeNatureState();
}

class _HomeNatureState extends State<HomeNature> {
  int? animalId;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              _buildHeadInfo(context),
              _buildHead(context),
              _buildListNature(context),
            ]),
      ),
    );
  }

  SliverToBoxAdapter _buildListNature(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Các dạng thiên nhiên khác',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      child: Image.asset(OneImages.ar_ocean),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeMain(
                                      id: 2,
                                    )));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      child: Image.asset(OneImages.ar_grass),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeMain(
                                      id: 3,
                                    )));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      child: Image.asset(OneImages.ar_jura),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeMain(
                                      id: 4,
                                    )));
                      }),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )
      ]),
    );
  }

  SliverToBoxAdapter _buildHead(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                child: Text(
                  'Dạng thiên nhiên nổi bật',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeMain(
                              id: 1,
                            )));
              },
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 15,
                          // offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(OneImages.ar_imageLogo)),
                  ),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset(OneImages.ar_tiger_kid),
                  ),
                  Positioned(
                    top: 160,
                    left: 215,
                    child: OneCard(
                      borderRadius: BorderRadius.circular(25),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: const [
                          Text(
                            'Tìm hiểu thêm',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.navigate_next,
                            size: 12,
                          )
                        ],
                      ),
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

  SliverToBoxAdapter _buildHeadInfo(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: Image.asset(OneImages.ar_logo)),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Chào mừng bạn đã đến',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
