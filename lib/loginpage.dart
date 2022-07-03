import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepractice/forgotpassword.dart';
import 'package:firebasepractice/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.black87,
          size: 50.0,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  String show = "";
  void showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Loading(),
    );
  }

  void hideProgressDialogue(BuildContext context) {
    Navigator.of(context).pop(Loading());
  }

  @override
  void initState() {
    super.initState();
    changes();
  }

  changes() async {
    // Obtain shared preferences.
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('repeat')) {
      Get.offAll(Homepage());
    }
  }

  @override
  bool showSpinner = false;
  bool isobs = true;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              style: TextStyle(color: Colors.cyan[200], fontSize: 40),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: TextField(
                    controller: email,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        fillColor: Colors.cyan[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.all(8.0),
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),

                height: 40,
                width: 1000,
                // color: Colors.white,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: TextField(
                    controller: pass,
                    obscureText: isobs,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        fillColor: Colors.cyan[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              isobs = !isobs;
                              setState(() {});
                            },
                            child: Icon(Icons.remove_red_eye)),
                        contentPadding: EdgeInsets.all(8.0),
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),

                height: 40,
                width: 1000,
                // color: Colors.white,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgot()),
                        );
                      },
                      child: Container(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        height: 20,
                      ),
                    ),
                  ),
                  // Text(show);
                ],
              ),
            ),
            Text(
              show,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  // print(showSpinner);

                  try {
                    var user = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: pass.text);
                    if (user != null) {
                      // print(showSpinner);
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('repeat', true);
                      showDialogue(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    show = e.message.toString();
                    setState(() {});
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  height: 40,
                  width: 1000,
                  decoration: BoxDecoration(
                      color: Colors.cyan[200],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ],
        ));
  }
}
