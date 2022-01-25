import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:new_drc_project/Pages/AudioPlayerDemo.dart';

class SongListDemo extends StatefulWidget {
  const SongListDemo({Key? key}) : super(key: key);

  @override
  _SongListDemoState createState() => _SongListDemoState();
}

class _SongListDemoState extends State<SongListDemo> {

  List<SongInfo> songs = [];

  getsong() async{
    final FlutterAudioQuery audioQuery = FlutterAudioQuery();
    songs= await audioQuery.getSongs();

    setState(() {});
  }


  @override
  void initState() {
    getsong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AudioPlayerDemo(song: songs[index]),));
              },
              child: Card(
                elevation: 2,
                shadowColor: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [


                      Text(songs[index].displayName.toString())

                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
