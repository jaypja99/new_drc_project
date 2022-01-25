import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayDemo extends StatefulWidget {
  var video;

  VideoPlayDemo({Key? key, this.video}) : super(key: key);

  @override
  _VideoPlayDemoState createState() => _VideoPlayDemoState();
}

class _VideoPlayDemoState extends State<VideoPlayDemo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.video), videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),);


    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var path = widget.video.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Video Play"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(padding: const EdgeInsets.only(top: 20.0)),

            Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    ClosedCaption(text: _controller.value.caption.text),
                   // _ControlsOverlay(controller: _controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );



  }


}
