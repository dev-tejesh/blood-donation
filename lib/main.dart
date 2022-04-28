import 'package:firebase_core/firebase_core.dart';
import 'package:firebasepractice/loginpage.dart';
import 'package:firebasepractice/needblood.dart';
import 'package:firebasepractice/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Blood Donation',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        home: MyHomePage(title: 'dddd '));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '“ Blood Donation Costs You Nothing, But It  Can Mean The World To Someone In Need ”',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.cyan[200], fontSize: 15),
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
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'REGISTER',
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
