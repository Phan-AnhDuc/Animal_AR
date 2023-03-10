import 'dart:math';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_list_color.dart';
import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:animal_ar/fireBase/fireBase_help.dart';
import 'package:animal_ar/search/ui_search.dart';
import 'package:animal_ar/ui/ui_home_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTips extends StatefulWidget {
  const ScreenTips({super.key});

  @override
  State<ScreenTips> createState() => _ScreenTipsState();
}

class _ScreenTipsState extends State<ScreenTips> {
  List<Map<String, dynamic>> _tipsDataList = [];
  @override
  void initState() {
    super.initState();
    getTipsData().then((tipsData) {
      setState(() {
        _tipsDataList = tipsData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Scrollbar(
          child: CustomScrollView(slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SliverAppBarDelegate(
                child: Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(OneImages.ar_background),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 1),
                              color: OneColors.textGreyDark.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ]),
                    child: AppBar(
                      title: const Align(
                          alignment: Alignment.center, child: SearchBar()),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    )),
                maxHeight: 68 + MediaQuery.of(context).padding.top,
                minHeight: 68 + MediaQuery.of(context).padding.top,
              ),
            ),
            SliverToBoxAdapter(
                child: Stack(
              children: [
                _buildCardAnimal(context),
              ],
            )),
          ]),
        ),
      ),
    );
  }

  Widget _buildCardAnimal(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          child: Image.asset(
            OneImages.ar_tip,
            fit: BoxFit.contain,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(OneImages.ar_back_tip), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'C?? TH??? EM CH??A BI???T ?',
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w900, color: OneColors.textBlack),
            )),
        const SizedBox(height: 5),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 26),
          itemCount: _tipsDataList.length,
          itemBuilder: (context, index) {
            Random random = Random();
            var indexRandom = random.nextInt(ColorRamdom.animalColor.length);
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: ColorRamdom.animalColor[indexRandom],
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedImage(
                        imageUrl: _tipsDataList[index]["imageUrl"],
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: Text(
                        _tipsDataList[index]["tip"],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
