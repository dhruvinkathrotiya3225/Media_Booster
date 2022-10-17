import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'global.dart';

class video_player extends StatefulWidget {
  video_player({Key? key, required this.video});

  List video;

  @override
  State<video_player> createState() => _video_playerState();
}

class _video_playerState extends State<video_player> {
  List pageVideo = [];

  List chuiecontroler = [];
  late VideoPlayerController videoPlayerController;

  initvideo() async {
    for (int i = 0; i < pageVideo.length; i++) {
      videoPlayerController =
          VideoPlayerController.network("${pageVideo[i]["path"]}")
            ..initialize().then((value) => setState(() {}));

      global.controller.add(videoPlayerController);

      chuiecontroler
          .add(ChewieController(videoPlayerController: global.controller[i]));
    }

    for (int i = 0; i < chuiecontroler.length; i++) {
      chuiecontroler[i] = ChewieController(
          videoPlayerController: global.controller[i], autoPlay: false);
    }
  }

  @override
  initState() {
    super.initState();
    pageVideo = widget.video;

    initvideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageVideo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Video player"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: pageVideo.length,
          itemBuilder: (context, index) {
            return (global.controller[index].value.isInitialized)
                ? AspectRatio(
                    aspectRatio: global.controller[index].value.aspectRatio,
                    child: Chewie(
                      controller: chuiecontroler[index],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
