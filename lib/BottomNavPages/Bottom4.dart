import 'package:flutter/material.dart';

class Bottom4 extends StatefulWidget {
  const Bottom4({Key? key}) : super(key: key);

  @override
  _Bottom4State createState() => _Bottom4State();
}

class _Bottom4State extends State<Bottom4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Bottom4",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
    );
  }
}
