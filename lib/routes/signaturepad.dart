import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signatureapp/models/sign-details.dart';

class ReviewSignaturePage extends StatelessWidget {
  final Details details;
  final Uint8List signature;
  const ReviewSignaturePage({Key? key, required this.signature, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    var color = Color.fromARGB(255, 108, 189, 255);
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () {()=> saveSignature(context);
              },
              icon: const Icon(Icons.save),
            ),
          ],
          centerTitle: true,
          title: const Text('Save Signature'),
        ),
        body: Center(
          child: Image.memory(signature),
        ));
  }

  Future? saveSignature(BuildContext context) async {
     FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection("Signatures").add(details.toJson());
     Navigator.pop(context);
      Get.snackbar('Success', 'Signature saved ');

/*
    final status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
    }

    making signature name unique
    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time';
    print(name);

    final result = await ImageGallerySaver.saveImage(signature, name: name);
    final isSuccessful = result['isSuccess'];

    if (isSuccessful) {
      Navigator.pop(context);
      Get.snackbar('Success', 'Signature saved to device',
          backgroundColor: Colors.white, colorText: Colors.green);
    } else {
      Get.snackbar('Success', 'Signature saved to device',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    if (signature == null) return;
    const fileName = 'signature';
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putData(signature);
     
    } catch (e) {
      print('error occured');
    }*/
  }
}
