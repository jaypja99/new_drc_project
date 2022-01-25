import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_drc_project/main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network( "https://assets4.lottiefiles.com/packages/lf20_puciaact.json",
              repeat: true,
              reverse: false,
              animate: true,
            ),
            SizedBox(width: 10,),
            Lottie.network( "https://assets6.lottiefiles.com/packages/lf20_cUG5w8.json",
              repeat: true,
              reverse: false,
              animate: true,
            ),
          ],
        ),
        ),
      ),
    );
  }
}
