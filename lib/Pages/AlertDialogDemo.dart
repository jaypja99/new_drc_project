import 'package:flutter/material.dart';


class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog"),backgroundColor: Colors.blueGrey),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Topic 2: AlertDialog Box", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: ElevatedButton(onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("AlertDialog 1"),
                    content: Text("Two Button"),
                    actions: <Widget>[

                      TextButton(onPressed: () { Navigator.pop(context, 'CANCEL');}, child: Text("CANCEL")),
                      TextButton(onPressed: () {Navigator.pop(context, 'OK');}, child: Text("OK")),
                    ],

                  );
                },
                );

              },
                child: Text("Alert Dialog 1"),),
            )
          ],
        ),
      ),
    );
  }
}
