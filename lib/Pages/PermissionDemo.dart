import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDemo extends StatefulWidget {
  const PermissionDemo({Key? key}) : super(key: key);

  @override
  _PermissionDemoState createState() => _PermissionDemoState();
}

class _PermissionDemoState extends State<PermissionDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PermissionDemo"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {  checkpermisssionCamera(); },
                    child: Row(
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.camera),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Camera Permission"),
                        )
                ],
                ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {  checkpermisssionLocation(); },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.location_on_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Location Permission"),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkpermisssionCamera() async {
    var status = await Permission.camera.status;
    // Permission.camera.request();
    if (status.isDenied) {
      await Permission.camera.request();
    } else {
      print("permission Already granted");
    }
  }

  void checkpermisssionLocation() async {
    var status1 = await Permission.location.status;

    if (status1.isDenied) {
      await Permission.location.request();
    } else {
      print("permission Already granted");
    }
  }
}
