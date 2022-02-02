import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_drc_project/BottomNavPages/Bottom4.dart';
import 'package:new_drc_project/Pages/ChartDemo.dart';
import 'package:new_drc_project/Pages/Splashscreen.dart';
import 'package:new_drc_project/Pages/VideoPlayerDemo.dart';

import 'BottomNavPages/Bottom1.dart';
import 'BottomNavPages/Bottom2.dart';
import 'BottomNavPages/Bottom3.dart';

import 'BottomNavPages/Bottom4.dart';
import 'Pages/AlertDialogDemo.dart';
import 'Pages/BottomSheetDemo.dart';
import 'Pages/DateTimeDemo.dart';
import 'Pages/ExpansionTileDemo.dart';
import 'Pages/GridViewDemo.dart';
import 'Pages/ListViewDemo.dart';
import 'Pages/LoginValidationDemo.dart';
import 'Pages/PermissionDemo.dart';
import 'Pages/ProgressBarDemo.dart';
import 'Pages/SonglistDemo.dart';
import 'Pages/TabBarDemo.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drc Systems",
      home: SplashScreen(),
    );

  }
}




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }


  int _selectedIndex = 0;
  List<Widget> bottompages= [Bottom1(),Bottom2(),ChartDemo(),Bottom4()];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(title: Text("Drc Systems"), backgroundColor: Colors.blueGrey),
        drawer: _drawer(),
        bottomNavigationBar: _bottomnav(),
        body: bottompages[_selectedIndex]
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "DRC Systems Flutter Topics",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              shadowColor: Colors.blueGrey,
              child: ListTile(
                title: Text("AlertDialog Box", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new AlertDialogDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              shadowColor: Colors.blueGrey,
              child: ListTile(
                title: Text("ProgressBar Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ProgressBarDemo()));
                },
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("DateTime Picker", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new DateTimeDemo()));
                },
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("Bottom Sheet", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new BottomSheetDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("ListView", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ListViewDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("GridView Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new GridViewDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("TabBar Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new TabBarDemo()));
                },
              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("ExpansionTile Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ExpansionTileDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("Permission Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new PermissionDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("AudioPlayer Demo", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new SongListDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              shadowColor: Colors.blueGrey,
              child: ListTile(
                title: Text("Video Player", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new VideoPlayerDemo()));
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
              child: ListTile(
                title: Text("Login With Validation", style: TextStyle(fontSize: 18)),
                leading: Icon(Icons.topic),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new LoginValidationDemo()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomnav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.blueGrey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.verified_user), label: "Verify"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

