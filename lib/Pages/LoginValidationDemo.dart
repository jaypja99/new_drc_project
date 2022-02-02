import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginValidationDemo extends StatefulWidget {
  const LoginValidationDemo({Key? key}) : super(key: key);

  @override
  _LoginValidationDemoState createState() => _LoginValidationDemoState();
}




class _LoginValidationDemoState extends State<LoginValidationDemo> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // DatabaseReference databaseRef =  FirebaseDatabase.instance.ref();
  //
  // // var databaseRef = FirebaseDatabase.instance.ref(".info/connected");
  //
  // FocusNode emailfocus = FocusNode();
  // FocusNode passwordfocus = FocusNode();
  // final _formKey = GlobalKey<FormState>();
  //
  // //database reference object
  //
  // void addData(String data) async {
  //
  //   await databaseRef.child('demoTest').push().set({
  //     "pushedText":data
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Login"),
  //         backgroundColor: Colors.blueGrey,
  //       ),
  //       body: FutureBuilder(
  //           future:  Firebase.initializeApp(),
  //           builder: (context, snapshot) {
  //             if (snapshot.hasError) {
  //               return Text(snapshot.error.toString());
  //             } else {
  //               return Padding(
  //                 padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
  //                 child: Form(
  //                   key: _formKey,
  //                   child: Column(
  //                     children: [
  //                       TextFormField(
  //                         focusNode: emailfocus,
  //                         controller: emailController,
  //                         textInputAction: TextInputAction.next,
  //                         decoration: const InputDecoration(
  //                           border: OutlineInputBorder(),
  //                           hintText: "Enter your Email",
  //                           labelText: "Email Address",
  //                         ),
  //                         validator: (value) {
  //                           bool emailValid = RegExp(
  //                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //                               .hasMatch(value.toString());
  //                           if (value.toString().isEmpty ||
  //                               emailValid == false) {
  //                             return "Password must contain at least 6 character";
  //                           }
  //                           return null;
  //                         },
  //                       ),
  //                       const SizedBox(height: 20),
  //
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 20),
  //                         child: SizedBox(
  //                           width: double.infinity,
  //                           height: 50,
  //                           child: ElevatedButton(
  //                               onPressed: () {
  //
  //                                 addData(emailController.text.toString());
  //                               },
  //                               child: Text(
  //                                 "Login",
  //                                 style: TextStyle(fontSize: 15),
  //                               )),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             }
  //
  //           }));
  // }

//   bool _userValidate=false;
//
//
//   FocusNode nameFocusNode=FocusNode();
//
//
//   TextEditingController nameController=TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//
//  final databaseReference = FirebaseDatabase.instance.ref();
// //
// //   final databaseReference = FirebaseDatabase(
// //       databaseURL:
// //       "https://drcsystems-3f6ca-default-rtdb.firebaseio.com/")
// //       .ref()
// //       .child("Items");
//
//   void addData(String pushedText)  {
//      databaseReference.child('demoTest').push().set({
//       "pushedText":pushedText
//     });
//   }
//
//
//   void initState(){
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Firebase Realtime Database"),),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const SizedBox(height: 10,),
//
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: TextFormField(
//                   onChanged: (text){
//                     if(text.length<4 || text.isEmpty){
//                       setState(() {
//                         _userValidate=true;
//                       });
//                     }else{
//                       setState(() {
//                         _userValidate=false;
//                       });
//                     }
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                   textInputAction: TextInputAction.done,
//                   focusNode: nameFocusNode,
//                   controller: nameController,
//                   decoration: InputDecoration(
//                       errorText: _userValidate?"Name must be greater than 4 digit":null,
//                       labelText: 'Enter your name',
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: const BorderSide(width: 3,color: Colors.blue)
//                       )
//                   ),
//                 ),
//               ),
//
//
//               Padding(padding: const EdgeInsets.all(20),child: ElevatedButton(
//                   onPressed: (){
//                     addData(nameController.text);
//                   }, child: const Text("Push")))
//             ],
//           ),
//         ),
//       ),
//     );

  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final name = "Name";

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    ref.child("sem").set("1");
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name),
                    SizedBox(width: 20),
                    Expanded(child: TextField(controller: myController)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.child(name).set(myController.text);
                  },
                  child: Text("Submit"),
                ),
              ],
            )));

  }
}
