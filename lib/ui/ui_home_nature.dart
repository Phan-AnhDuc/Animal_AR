import 'package:animal_ar/const/ar_card.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/pages/evolution_screen.dart';
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
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
          _buildHeadInfo(context),
          _buildHead(context),
          _buildEveryThing(context),
          _buildListNature(context),
        ]),
      ),
    );
  }

  SliverToBoxAdapter _buildEveryThing(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenTips()));
            },
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                        color: Color(0xFFFCC2FC),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 150,
                          child: Image.asset(
                            'assets/images/image_tip.png',
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              border: Border.all(color: Colors.white, width: 3),
                              color: Colors.white),
                          child: SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff95BDFF),
                                    borderRadius: BorderRadius.circular(10),
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
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        "Tips",
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                )
                // Text(name ?? ""),
                // Text(infoAnimal ?? ""),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EvolutionScreen()));
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                          color: Color(0xFFCDE990),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 150,
                            child: Image.asset(
                              'assets/images/image_tienhoa.png',
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white, width: 3),
                                color: Colors.white),
                            child: SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff95BDFF),
                                      borderRadius: BorderRadius.circular(10),
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
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          "Tiến Hóa",
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  )
                  // Text(name ?? ""),
                  // Text(infoAnimal ?? ""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildListNature(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5),
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
                    child: ClipRRect(borderRadius: BorderRadius.circular(25), child: Image.asset(OneImages.ar_imageLogo)),
                  ),
                  SizedBox(
                    height: 270,
                    width: 270,
                    child: Image.asset(OneImages.ar_tiger_kid),
                  ),
                  Positioned(
                    top: 180,
                    left: 230,
                    child: OneCard(
                      borderRadius: BorderRadius.circular(25),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: const [
                          Text(
                            'Tìm hiểu thêm',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(height: MediaQuery.of(context).size.height * 0.16, child: Image.asset(OneImages.ar_logo)),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
