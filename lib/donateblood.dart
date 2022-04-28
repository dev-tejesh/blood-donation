import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class Donateblood extends StatefulWidget {
  const Donateblood({Key? key}) : super(key: key);

  @override
  State<Donateblood> createState() => _DonatebloodState();
}

class _DonatebloodState extends State<Donateblood> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  // TextEditingController _controller = TextEditingController();
  TextEditingController city = TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  var items = [
    "A+",
    "A−",
    'B+',
    'B−',
    'AB+',
    'AB−',
    'O+',
    'O−',
  ];
  late String countryValue;
  late String stateValue;
  late String cityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
              child: Text(
                'Name',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: name,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      fillColor: Colors.indigo[50],
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Name',
                      // prefixIcon: Icon(Icons.email),
                      // contentPadding: EdgeInsets.all(8.0),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      hintStyle: TextStyle(color: Colors.white)),
                ),

                height: 40,
                width: 1000,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
              child: Text(
                'email',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: email,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      fillColor: Colors.indigo[50],
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      // contentPadding: EdgeInsets.all(8.0),
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                      hintStyle: TextStyle(color: Colors.white)),
                ),

                height: 40,
                width: 1000,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
              child: Text(
                'Phone',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: phone,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      fillColor: Colors.indigo[50],
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Phone',
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      // prefixIcon: Icon(Icons.email),
                      // contentPadding: EdgeInsets.all(8.0),
                      hintStyle: TextStyle(color: Colors.white)),
                ),

                height: 40,
                width: 1000,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
              child: Text(
                'Blood Type',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 40,
                // width: 1000,
                child: TextField(
                  controller: _controller,
                  enabled: true,
                  decoration: InputDecoration(
                    prefixIcon: new PopupMenuButton<String>(
                      // color: Colors.black,
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _controller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                    hintText: "Choose your blood group",
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
            //   child: Text(
            //     'City',
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // height: 600,
                child: Column(
                  children: [
                    SelectState(
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                    // InkWell(
                    //   onTap:(){
                    //     print('country selected is $countryValue');
                    //     print('country selected is $stateValue');
                    //     print('country selected is $cityValue');
                    //   },
                    //   child: Text(' Check')
                    // )
                  ],
                )),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     child: TextField(
            //       controller: city,
            //       textAlign: TextAlign.start,
            //       decoration: InputDecoration(
            //           fillColor: Colors.indigo[50],
            //           filled: true,
            //           border: InputBorder.none,
            //           hintText: 'City',
            //           // prefixIcon: Icon(Icons.email),
            //           // contentPadding: EdgeInsets.all(8.0),
            //           contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            //           hintStyle: TextStyle(color: Colors.white)),
            //     ),

            //     height: 40,
            //     width: 1000,
            //     // color: Colors.white,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       shape: BoxShape.rectangle,
            //       border: Border.all(
            //         color: Colors.black,
            //         width: 1.0,
            //       ),
            //       borderRadius: BorderRadius.all(Radius.circular(5)),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // final user = User(
                  //   name: name.text,
                  //   email: email.text,
                  //   phone: int.parse(phone.text),
                  //   blood: _controller.text,
                  //   city: city.text,
                  // );
                  createUser();
                },
                child: Container(
                  height: 40,
                  width: 1000,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: Text('Create Profile')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createUser() async {
    EasyLoading.show(status: "saving");
    await FirebaseFirestore.instance.collection('users').doc().set({
      "name": name.text,  
      "email": email.text,
      "phone": phone.text,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "blood": _controller.text,
      "city": cityValue
    });
    Get.back();
    EasyLoading.dismiss();
  }
}
