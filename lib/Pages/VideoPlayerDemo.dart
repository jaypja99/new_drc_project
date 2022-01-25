import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_drc_project/Pages/VideoPlayDemo.dart';

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({Key? key}) : super(key: key);

  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {

  final Directory _videoDir = Directory('/storage/emulated/0/IDM/Videos');





  @override
  Widget build(BuildContext context) {
    final videoList = _videoDir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith('.mp4') || item.endsWith('.mkv') || item.endsWith('.avi'))
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("VideoPlayer"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayDemo(video: videoList[index].toString()),));
              },
              child: Card(
                elevation: 2,
                shadowColor: Colors.blueGrey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Text(videoList[index].toString()),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
