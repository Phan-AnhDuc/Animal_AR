import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_theme.dart';
import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:animal_ar/ui/ui_home_main.dart';
import 'package:flutter/material.dart';

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
            margin: const EdgeInsets.only(top: 40),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: OneColors.bHA,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 7,
                        // offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Các dạng thiên nhiên',
                      style: OneTheme.of(context).body1.copyWith(color: OneColors.white, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      child: const CachedImage(imageUrl: OneImages.ar_forest),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeMain(
                                      id: 1,
                                    )));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                      child: const CachedImage(imageUrl: OneImages.ar_ocean),
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
                      child: const CachedImage(imageUrl: OneImages.ar_grass),
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
                      child: const CachedImage(imageUrl: OneImages.ar_jura),
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
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              // offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              child: CachedImage(imageUrl: OneImages.ar_imageLogo),
            )),
      ),
    );
  }
}
