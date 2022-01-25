import 'package:flutter/material.dart';

class ProgressBarDemo extends StatefulWidget {
  const ProgressBarDemo({Key? key}) : super(key: key);

  @override
  _ProgressBarDemoState createState() => _ProgressBarDemoState();
}

class _ProgressBarDemoState extends State<ProgressBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressBar Demo"),
        backgroundColor: Colors.blueGrey,

      ),
      body: Container(
        child: Column(
          children: const [
            LinearProgressIndicator(),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
