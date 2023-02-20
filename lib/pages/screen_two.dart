import 'package:animal_ar/const/ar_card.dart';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_text.dart';
import 'package:animal_ar/const/ar_theme.dart';
import 'package:flutter/material.dart';

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
              child: Container(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                    itemCount: history.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width - 44,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              history[index].year,
                                              style: OneTheme.of(context).body1.copyWith(color: OneColors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width - 44,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Center(
                                            child: Text(
                                              history[index].event,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )),
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
}
