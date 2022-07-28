import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:signatureapp/routes/personaldetails.dart';
import 'package:signatureapp/models/sign-details.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({Key? key}) : super(key: key);

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    var logo1;
    final newSign = Details('','','',logo1.png,);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(25),
            child: CircleAvatar(
              radius: 100.0,
              child: ClipRRect(
                child: Image.asset('assets/images/sign.png'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text(
                'Add Signature',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  PersonalDetails(
                            details: newSign,
                          )),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text(
                'Verify Signature',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {},
            ),
          ),
        ])));
  }
}
