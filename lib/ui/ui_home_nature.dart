import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_theme.dart';
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
          _buildHeadInfo(context),
          _buildHead(context),
          _buildListNature(context),
          //_buildComingSoon(context),
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
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Các dạng thiên nhiên khác',
                      style: OneTheme.of(context).body2.copyWith(color: OneColors.black, fontSize: 17),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20),
                //   child: InkWell(
                //       child: Image.asset(OneImages.ar_ice),
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const HomeMain(
                //                       id: 1,
                //                     )));
                //       }),
                // ),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Dạng thiên nhiên nổi bật',
                  style: OneTheme.of(context).body2.copyWith(color: OneColors.black, fontSize: 17),
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
              child: Container(
                width: MediaQuery.of(context).size.width,
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
          padding: const EdgeInsets.only(top: 50.0, left: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: OneTheme.of(context).body1.copyWith(color: OneColors.black, fontSize: 30),
              ),
              Text(
                'Animal Kids',
                style: OneTheme.of(context).body1.copyWith(color: OneColors.black, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SliverToBoxAdapter _buildComingSoon(BuildContext context) {
  //   return SliverToBoxAdapter(
  //     child: Container(
  //       margin: const EdgeInsets.only(top: 40),
  //       color: Colors.transparent,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             decoration: BoxDecoration(
  //               color: OneColors.bHA,
  //               borderRadius: BorderRadius.circular(10),
  //               boxShadow: const [
  //                 BoxShadow(
  //                   color: Colors.white,
  //                   spreadRadius: 5,
  //                   blurRadius: 7,
  //                   // offset: Offset(0, 3),
  //                 ),
  //               ],
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.all(6.0),
  //               child: Text(
  //                 'Coming soon',
  //                 style: OneTheme.of(context).body1.copyWith(color: OneColors.white, fontSize: 18),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 30),
  //           Padding(
  //             padding: const EdgeInsets.only(right: 20),
  //             child: Image.asset(OneImages.ar_ice),
  //           ),
  //           const SizedBox(height: 30),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
