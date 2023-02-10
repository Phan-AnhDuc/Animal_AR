import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_theme.dart';
import 'package:animal_ar/ui/ui_home_tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CollectionReference data = FirebaseFirestore.instance.collection("modeldata");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_splash), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.6, child: Image.asset(OneImages.ar_logo)),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Lottie.asset(
                      "assets/images/loadingAnimal.json",
                      onLoaded: (p0) {
                        Future.delayed(const Duration(seconds: 5), (() {
                          setState(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeTabs()));
                          });
                        }));
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Không có kết nối Internet\nVui lòng kiểm tra lại kết nối mạng!",
                            style: OneTheme.of(context).title1.copyWith(color: OneColors.textOrange),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        child: StreamBuilder(
                            stream: data.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                const Center(child: CircularProgressIndicator(color: OneColors.brandVNP));
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot records = snapshot.data!.docs[index];

                                    // Image colors
                                    String? imageUrl = records["imageUrl"];

                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 10),
                                      child: SizedBox(child: _buildImageUrl(imageUrl ?? "")),
                                    );
                                  },
                                );
                              }
                              return Container();
                            }),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildImageUrl(String imageUrl) {
    return CircleAvatar(
      radius: 10,
      child: Image.network(imageUrl,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                color: OneColors.brandVNP,
                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Image.asset("assets/images/jura.png")),
    );
  }
}
