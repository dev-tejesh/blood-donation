import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepractice/homepage.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController displaycontroller = TextEditingController();
  String error = "";
  @override
  bool showPass = true;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'REGISTER',
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
                    controller: displaycontroller,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        fillColor: Colors.cyan[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'DISPLAY NAME',
                        prefixIcon: Icon(Icons.person),
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
                    controller: emailcontroller,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        fillColor: Colors.cyan[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'EMAIL',
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
                    controller: passcontroller,
                    obscureText: showPass,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        fillColor: Colors.cyan[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'PASSWORD',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              showPass = !showPass;
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
            Text(
              error,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passcontroller.text);

                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Homepage();
                      }));
                    }
                  } on FirebaseAuthException catch (e) {
                    error = e.message.toString();
                    setState(() {});
                  }
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CREATE ACCOUNT',
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
