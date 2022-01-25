import 'package:flutter/material.dart';


class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({Key? key}) : super(key: key);

  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionTileDemo"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 5, bottom: 2),
                child: Card(
                  elevation: 2,
                  child: ExpansionTile(
                    title: Text("DRC Systems"),
                    leading: Expanded(
                      child: CircleAvatar(
                          child: Image(image: AssetImage("Images/drc.png"))),
                    ),

                    children: [
                      ListTile(
                        title: Text("Number : +919998887632"),
                        contentPadding: EdgeInsets.all(15),
                        trailing: Icon(Icons.call),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
