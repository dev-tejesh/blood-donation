import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepractice/deleteuser.dart';
import 'package:firebasepractice/donateblood.dart';
import 'package:firebasepractice/loginpage.dart';
import 'package:firebasepractice/main.dart';
import 'package:firebasepractice/needblood.dart';
import 'package:firebasepractice/registeredusers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  tej() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('repeat');
    Get.offAll(MyHomePage(title: 'tej'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            'Hey Welcome',
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  color: Colors.red,
                ),
                child: Image(
                  image: AssetImage('assets/bloodimg.png'),
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(Donateblood());
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    color: Colors.red,
                  ),
                  height: 100,
                  width: 1000,
                  // color: Colors.red,
                  child: Center(
                      child: Text(
                    'DONATE BLOOD',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(Needblood());
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    color: Colors.red,
                  ),
                  height: 100,
                  width: 1000,
                  child: Center(
                      child: Text(
                    'NEED BLOOD',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
        drawer: Container(
          width: 250,
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 0),
              child: Column(
                // padding: EdgeInsets.zero,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(Registeredusers());
                    },
                    child: Container(
                      width: 1000,
                      height: 40,
                      // color: Colors.green,
                      child: Center(
                          child: Text(
                        'REGISTERED USERS',
                        // style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Donateblood());
                    },
                    child: Container(
                      width: 1000,
                      height: 40,
                      // color: Colors.green,
                      child: Center(
                          child: Text(
                        'DONATE BLOOD',
                        // style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Needblood());
                    },
                    child: Container(
                      width: 1000,
                      height: 40,
                      // color: Colors.green,
                      child: Center(
                          child: Text(
                        'NEED BLOOD',
                        // style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Deletedata());
                    },
                    child: Container(
                      width: 1000,
                      height: 40,
                      // color: Colors.green,
                      child: Center(
                          child: Text(
                        'DELETE PROFILE',
                        // style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(MyHomePage(title: 'tej'));
                      tej();
                    },
                    child: Container(
                      width: 1000,
                      height: 40,
                      // color: Colors.green,
                      child: Center(
                          child: Text(
                        'LOGOUT',
                        // style: TextStyle(color: Colors.black),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//           padding: EdgeInsets.all(20),
//           child: InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return MyHomePage(
//                     title: "ffdf",
//                   );
//                 }));
//               },
//               child: Text('logout')),

//         ),
