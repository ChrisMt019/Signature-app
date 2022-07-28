import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:signatureapp/routes/homesignpage.dart';

class AddSignature extends StatefulWidget {
  const AddSignature({Key? key}) : super(key: key);

  @override
  State<AddSignature> createState() => _AddSignatureState();
}

class _AddSignatureState extends State<AddSignature> {
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
          const Text('Enter Your Signature'),
          const Text('Make sure you sign in your best penmanship,Note: You need to sign 3times'),
          Container(
            margin: const EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeSignPage()),
                );
              },
            ),
          ),
        ])));
  }
}
