import 'package:flutter/material.dart';

class Bottom3 extends StatefulWidget {
  const Bottom3({Key? key}) : super(key: key);

  @override
  _Bottom3State createState() => _Bottom3State();
}

class _Bottom3State extends State<Bottom3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Bottom3",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
    );
  }
}
