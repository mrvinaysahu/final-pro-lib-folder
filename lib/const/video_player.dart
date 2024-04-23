import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'customwidget_home.dart';

class VideoPlayerPage extends StatefulWidget {
  String url;
  String title;
  String description;
  VideoPlayerPage(this.url, this.title, this.description, {super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController),
          sizedBox10(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: boldTextSize18(widget.title)),
                  sizedBox10(),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.description,
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }

  void initializeVideoPlayer() {
    late CachedVideoPlayerController _videoPlayerController;
    _videoPlayerController = CachedVideoPlayerController.network(widget.url)
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}
