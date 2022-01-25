import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:new_drc_project/Pages/SonglistDemo.dart';

class AudioPlayerDemo extends StatefulWidget {
  SongInfo song;
  AudioPlayerDemo({Key? key, required this.song}) : super(key: key);

  @override
  _AudioPlayerDemoState createState() => _AudioPlayerDemoState();
}

class _AudioPlayerDemoState extends State<AudioPlayerDemo> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  bool like = false;
  bool playpause = false;
  var files;
  late AudioCache audioCache;

  @override
  void initState() {
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onAudioPositionChanged.listen((Duration po) {
      setState(() {
        position = po;
      });
    });
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.release();

    super.dispose();
  }

  playMusic() async {
    await audioPlayer.play(widget.song.filePath);
    setState(() {
      playpause = true;
    });
  }

  pauseMusic() async {
    await audioPlayer.pause();
    setState(() {
      playpause = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.0, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Audio Player",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SongListDemo()));
                    },
                    icon: Icon(Icons.list))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 350,

                       child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ), //Offset
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                ), //BoxShadow
                              ],
                              borderRadius: BorderRadius.circular(20),
                              image:  DecorationImage(
                                  image: AssetImage("assets/Images/atrangi.jpg"),
                                  fit: BoxFit.cover)
                            ),
                          ),
                //
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 50),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.song.displayName.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "Artist:" +
                          widget.song.artist

                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: like
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  like = false;
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  like = true;
                                });
                              },
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              )),
                    ),
                  ],
                )
              ],
            ),
          ),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Slider.adaptive(
                      min: 0.0,
                      value: position.inSeconds.toDouble(),
                      max: duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          audioPlayer.seek(new Duration(seconds: value.toInt()));
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(position.toString()),
                        Text(duration.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          
          
          
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(10)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.skip_previous,
                            size: 50,
                          )
                        ],
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () async {
                        playpause ? pauseMusic() : playMusic();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: playpause
                                ? Icon(Icons.pause_circle_filled_rounded,
                                    size: 50)
                                : Icon(
                                    Icons.play_circle_fill_rounded,
                                    size: 50,
                                  ),
                          )
                        ],
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.all(10)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.skip_next_rounded,
                            size: 50,
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            audioPlayer.seek(new Duration(seconds: value.toInt()));
          });
        });
  }
}
