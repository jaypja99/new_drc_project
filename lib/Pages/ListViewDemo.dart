import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView"), backgroundColor: Colors.blueGrey),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shadowColor: Colors.blueGrey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(title: Text('Welcome To DRC Systems')),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets .only(left: 15, bottom: 5),
                        child: ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {},
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          );
        },
        // child: ListView(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.all(20.0),
        //   children: [
        //
        //   ],
        // ),
      ),
    );
  }
}
