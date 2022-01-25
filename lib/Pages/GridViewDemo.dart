import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Demo"),
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
          itemCount:10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),
          itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("Images/drc.png",fit: BoxFit.fitWidth,),
                ),
              );
          },),
    );
  }
}
