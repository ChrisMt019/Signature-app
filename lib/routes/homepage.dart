import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:signature/signature.dart';
import 'package:signatureapp/routes/signaturepad.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SignatureController? controller;

  @override
  void initState() {
    super.initState();
    signaturecontrol();
  }

  void signaturecontrol() {
    // we initialize the signature controller
    controller = SignatureController(penStrokeWidth: 5, penColor: Colors.black);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sign'),
        ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: controller!,
              backgroundColor: Colors.white,
            ),
          ),
          buttonWidgets(context)!,
          buildSwapOrientation(context)!,
        ],
      ),
    );
  }

  Widget? buildSwapOrientation(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final newOrientation =
            isPortrait ? Orientation.landscape : Orientation.portrait;

        controller!.clear();

        setOrientation(newOrientation);
      },
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPortrait
                  ? Icons.screen_lock_portrait
                  : Icons.screen_lock_landscape,
              size: 40,
            ),
            const SizedBox(
              width: 12,
            ),
            const Text(
              'Tap to change signature orientation',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void setOrientation(Orientation orientation) {
    if (orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  Widget? buttonWidgets(BuildContext context) => Container(
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              onPressed: () async {
                if (controller!.isNotEmpty) {
                  final signature = await exportSignature();

                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) =>
                          ReviewSignaturePage(signature: signature!)),
                    ),
                  );

                  controller!.clear();
                }
              },
              iconSize: 40,
              color: Colors.blue,
              icon: const Icon(Icons.check)),
          IconButton(
              onPressed: () {
                controller!.clear();
              },
              iconSize: 40,
              color: Colors.red,
              icon: const Icon(Icons.close)),
        ]),
      );

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      exportBackgroundColor: Colors.white,
      penColor: Colors.black,
      points: controller!.points,
    );

    final signature = exportController.toPngBytes();

    //clean up the memory
    exportController.dispose();

    return signature;
  }
}
