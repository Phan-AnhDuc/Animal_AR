import 'package:animal_ar/const/ar_card.dart';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_text.dart';
import 'package:animal_ar/const/ar_theme.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class ScreenKnown extends StatefulWidget {
  const ScreenKnown({super.key});

  @override
  State<ScreenKnown> createState() => _ScreenKnownState();
}

class _ScreenKnownState extends State<ScreenKnown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch sử tiến hóa của sự sống"),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
            _buildHeader(context),
          ]),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            OneCard(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    Text(OneText.ar_text_1),
                    SizedBox(height: 10),
                    Text(OneText.ar_text_2),
                  ],
                ),
              ),
            ),
            OneCard(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset(OneImages.ar_evulution, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: OneColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 212, 207, 207),
                    spreadRadius: 1,
                    blurRadius: 1,
                    // offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Lịch trình cơ bản',
                  style: OneTheme.of(context).body1.copyWith(color: OneColors.black, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 5),
            OneCard(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: _buildTimeline(),
              ),
            ),
            OneCard(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset(OneImages.ar_evulution2, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Timeline _buildTimeline() {
    return Timeline.tileBuilder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                history[index].year,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(history[index].event),
            ],
          ),
        ),
        itemCount: history.length,
      ),
    );
  }
}
