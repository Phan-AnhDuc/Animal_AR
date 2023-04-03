import 'package:animal_ar/const/ar_image.dart';
import 'package:animal_ar/const/ar_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:video_player/video_player.dart';

class ScreenKnown extends StatefulWidget {
  const ScreenKnown({super.key});

  @override
  State<ScreenKnown> createState() => _ScreenKnownState();
}

class _ScreenKnownState extends State<ScreenKnown> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  double _volume = 0.5;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/evoVideo.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(OneImages.ar_background), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: [
            _buildHeader(context),
            _buildVideoEvo(),
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
            const SizedBox(height: 70),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.7),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                'Lịch sử tiến hóa của động vật',
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.8),
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

  SliverToBoxAdapter _buildVideoEvo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.7),
          ),
          padding: const EdgeInsets.all(10),
          child: _controller!.value.isInitialized
              ? Column(
                  children: [
                    SizedBox(
                      height: 205,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 205,
                            width: MediaQuery.of(context).size.width,
                            child: VideoPlayer(_controller!),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: VideoProgressIndicator(
                              _controller!,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                playedColor: Colors.blue,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: _volume,
                      onChanged: (value) {
                        setState(() {
                          _volume = value;
                          _controller?.setVolume(value);
                        });
                      },
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      label: '${(_volume * 10).round()}',
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPlaying = !_isPlaying;
                            _isPlaying ? _controller!.play() : _controller!.pause();
                          });
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 201, 201, 201), borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 48.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
