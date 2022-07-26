import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:signatureapp/models/sign-details.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signatureapp/routes/queryscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var primarycolor = Color.fromARGB(255, 71, 165, 242);
    return GetMaterialApp(
      title: 'Signature App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ignore: prefer_const_constructors
        primaryColor: primarycolor,
      ),
      home: const QueryScreen(),
    );
  }
}