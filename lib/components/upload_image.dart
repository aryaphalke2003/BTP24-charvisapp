

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:charvis/providers/provider.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({Key? key}) : super(key: key);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  bool isImageUploaded = false;
  bool isBeingUploaded = false;
  String cname = "";

  @override
  void initState() {
    super.initState();
  }

  final FlutterTts flutterTts = FlutterTts();

  // Speaks en-US language
  void speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    if (text.isNotEmpty) await flutterTts.speak(text);
  }

  void stop() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: ((builder) => bottomSheet()),
        ),
        child: Icon(Icons.camera_alt_outlined),
      ),
      body: Center(
        child: isBeingUploaded
            ? CircularProgressIndicator()
            : isImageUploaded
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(
                        File(_imageFile!.path),
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'This is an image of a $cname chart!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          print("cname is : ${cname}");
                          speak('This is an image of a $cname chart');
                        },
                        child: Text('Speak'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Chart Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Chart Photo",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                  setState(() {
                    isBeingUploaded = true;
                  });
                },
                child: Row(
                  children: const [
                    Icon(Icons.camera),
                    SizedBox(width: 8),
                    Text("Camera"),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                  setState(() {
                    isBeingUploaded = true;
                  });
                },
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    SizedBox(width: 8),
                    Text('Gallery'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    try {
      _imageFile = await _picker.pickImage(source: source, imageQuality: 15);
    } catch (e) {
      rethrow;
    }

    if (_imageFile != null) {
      print("notnullselec");

      // var response = await getImageDetails(_imageFile!);
      // print("response is : ${response}");
      // response.then((value) {
      //   print("value is : ${value}");
      //   setState(() {
      //     cname = value;
      //     isBeingUploaded = false;
      //     isImageUploaded = true;
      //   });
      // });
      setState(() {
        cname = "pie"; // Set cname state

        isBeingUploaded = false;
        isImageUploaded = true;
      });
    }
  }
}