import 'package:animal_ar/const/ar_image.dart';
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
            margin: const EdgeInsets.only(top: 60),
            color: Colors.transparent,
            child: Column(
              children: [
                InkWell(
                    child: Image.asset(OneImages.ar_ocean),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeMain(
                                    id: 1,
                                  )));
                    }),
                InkWell(
                    child: Image.asset(OneImages.ar_forest),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeMain(
                                    id: 2,
                                  )));
                    }),
                InkWell(child: Image.asset(OneImages.ar_grass)),
                InkWell(child: Image.asset(OneImages.ar_jura)),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
