import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final bool play;
  final String url;

  const VideoWidget({required this.url, required this.play});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  // final controller = Get.put(VideolabController());
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.0,
              ), //(8.0),
              child: Chewie(
                key: PageStorageKey(widget.url),
                controller: ChewieController(
                  videoPlayerController: videoPlayerController,
                  aspectRatio: 2.0 / 1.35,
                  autoInitialize: true,
                  looping: false,
                  autoPlay: false,
                  errorBuilder: (context, errorMessage) {
                    return Center(
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
