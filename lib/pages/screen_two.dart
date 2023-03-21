import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      OneText.ar_text_1,
                      style: GoogleFonts.aBeeZee(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      OneText.ar_text_2,
                      style: GoogleFonts.aBeeZee(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Image.asset(OneImages.ar_evulution, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('Lịch trình cơ bản', style: GoogleFonts.aBeeZee(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: _buildTimeline(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.7),
              ),
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
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                history[index].event,
                style: GoogleFonts.aBeeZee(),
              ),
            ],
          ),
        ),
        itemCount: history.length,
      ),
    );
  }
}
