import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_drc_project/main.dart';

class FirebaseNotificationDemo extends StatefulWidget {
  const FirebaseNotificationDemo({Key? key}) : super(key: key);

  @override
  _FirebaseNotificationDemoState createState() => _FirebaseNotificationDemoState();
}

class _FirebaseNotificationDemoState extends State<FirebaseNotificationDemo> {

  // late FirebaseMessaging firebaseMessaging;
  //
  // @override
  // void initState() async{
  //   // TODO: implement initState
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  //   FirebaseMessaging.onBackgroundMessage(_messageHandler);
  //   runApp(MyApp());
  //   super.initState();
  //   }
  //
  //
  // Future<void> _messageHandler(RemoteMessage message) async {
  //   print('background message ${message.notification!.body}');
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Notification"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Container(

      ),
    );
  }
}
