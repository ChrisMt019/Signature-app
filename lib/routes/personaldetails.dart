import 'package:flutter/material.dart';
import 'package:signatureapp/routes/addsignature.dart';
import 'package:signatureapp/models/sign-details.dart';

import 'addsignature.dart';

class PersonalDetails extends StatelessWidget {
  final Details details;
  const PersonalDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('FirstName'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: _titleController,
                autofocus: true,
              ),
            ),
            const Text('SecondName'),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                autofocus: true,
              ),
            ),
            const Text('Occupation'),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                autofocus: true,
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: ()  {
                details.firstName = _titleController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddSignature(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
