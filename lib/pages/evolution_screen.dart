import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/cache/ar_cache_image.dart';
import 'package:animal_ar/fireBase/fireBase_help.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EvolutionScreen extends StatefulWidget {
  const EvolutionScreen({super.key});

  @override
  State<EvolutionScreen> createState() => _EvolutionScreenState();
}

class _EvolutionScreenState extends State<EvolutionScreen> {
  List<Map<String, dynamic>> _evoDataList = [];
  @override
  void initState() {
    super.initState();
    getEvolutionData().then((evoData) {
      setState(() {
        _evoDataList = evoData;
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
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              _buildListEvo(),
            ]),
      ),
    );
  }

  SliverToBoxAdapter _buildListEvo() {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 26),
        itemCount: _evoDataList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  _evoDataList[index]["name"],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedImage(
                    imageUrl: _evoDataList[index]["image"],
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _evoDataList[index]["news"],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
