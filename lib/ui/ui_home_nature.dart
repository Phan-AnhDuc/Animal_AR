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
    return Scaffold(
      backgroundColor: const Color(0xffFFCACA),
      body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
        _buildListNature(context),
      ]),
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
                    child: Image.asset('assets/images/forest.png'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeMain()));
                    }),
                InkWell(
                    child: Image.asset('assets/images/ocean.png'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeMain()));
                    }),
                InkWell(child: Image.asset('assets/images/grass.png')),
                InkWell(child: Image.asset('assets/images/jura.png')),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
