import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Topic 3: BottomSheet Demo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: ElevatedButton(
                child: Text("Bottom Sheet 1"),
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container( child: const Center(
                      child: Text(
                        "Welcome To DRC Systems"
                      ),
                    ),
                    );
                  },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
