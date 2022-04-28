import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController forgotpass = TextEditingController();
  String show = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: TextField(
                  controller: forgotpass,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      fillColor: Colors.cyan[200],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'enter your email',
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
          Text(
            show,
            style: TextStyle(color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                print(forgotpass.text);
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgotpass.text);
                  // print('success');
                  show = 'email has been sent with a link to reset password';
                  setState(() {});
                } on FirebaseAuthException catch (e) {
                  show = e.message.toString();
                  setState(() {});
                }
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Reset Password',
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
      )),
    );
  }
}
