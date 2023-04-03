import 'package:animal_ar/const/ar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class Image3D extends StatefulWidget {
  const Image3D({Key? key, required this.urls}) : super(key: key);
  final String urls;

  @override
  State<Image3D> createState() => _Image3DState();
}

class _Image3DState extends State<Image3D> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    requestPermistion();
  }

  void requestPermistion() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.videos.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("InAppWebView test"),
        // ),
        body: Stack(children: <Widget>[
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: Uri.parse(widget.urls)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
              return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
            }),
      ),
      Positioned(
        top: 50,
        child: _buildHuongDan(),
      ),
    ]));
  }

  SizedBox _buildHuongDan() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cách sử dụng quét hình ảnh',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    'assets/images/ex1.png',
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(height: 20),
                              Text(
                                'Chọn động vật bạn muốn quét',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                            color: OneColors.black,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    'assets/images/ex2.png',
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(height: 20),
                              Text(
                                'Quét vào hình ảnh cố định của nó',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                            color: OneColors.black,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    'assets/images/ex3.png',
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(height: 20),
                              Text(
                                'Giữ cố định máy để hiện ảnh 3D',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 170),
          // IgnorePointer(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: const LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment(0.8, 1),
          //         colors: <Color>[
          //           Color(0xffB2A4FF),
          //           Color(0xff576CBC),
          //           Color(0xffB0DAFF),
          //           Color(0xffB9E9FC),
          //           Color(0xffB4E4FF),
          //         ], // Gradient from https://learnui.design/tools/gradient-generator.html
          //         tileMode: TileMode.mirror,
          //       ),
          //       borderRadius: BorderRadius.circular(50),
          //     ),
          //     padding: const EdgeInsets.only(right: 50, left: 50, top: 20, bottom: 20),
          //     child: Text(
          //       'Quét ảnh',
          //       style: GoogleFonts.aBeeZee(
          //         fontSize: 35,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
