import 'package:flutter/material.dart';
import 'second_step_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class FirstStepPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/4, 16.0, MediaQuery.of(context).size.width/4, 16.0),
            decoration: BoxDecoration(
              color: Colors.teal[100],
              border: Border.all(color: const Color.fromARGB(137, 188, 188, 188), width: 2)
              ),
            child: Padding( 
              padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
              child: Text(
                'Home Food Made Easy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Step 1 of 3',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,70.0),
                    child: Text(
                      'Take a picture of your food',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImageCapturePage()),
                      );
                    },
                    child: Icon(Icons.camera_alt),
                    backgroundColor: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(36.0, 0.0, 26.0, 0.0),
                    child: const Padding(
                    padding: EdgeInsets.fromLTRB(16.0,60.0,16.0,16.0),
                    child: Text(
                      'Tips:\n1. Try to keep all the products in frame\n2. Don\'t include other objects\n3. Go to a well light area for a better picture quality',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondStepPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Adjust border radius here
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Go back to previous screen
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal, // text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Adjust border radius here
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ImageCapturePage extends StatefulWidget {
  @override
  _ImageCapturePageState createState() => _ImageCapturePageState();
}

class _ImageCapturePageState extends State<ImageCapturePage> {
  final ImagePicker _picker = ImagePicker();
  String _rgbValue = "No image analyzed yet";

  Future<void> _takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      await _sendImage(photo.path);
    }
  }

  Future<void> _sendImage(String path) async {
    var uri = Uri.parse('http://172.0.0.1:5000/api/analyze');
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('picture', path));
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.bytesToString().then((value) {
        setState(() {
          _rgbValue =
              "RGB Value at (0,0): ${json.decode(value)['rgb'].toString()}";
        });
      });
    } else {
      setState(() {
        _rgbValue = "Failed to analyze image";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _takePicture,
              child: Text('Take Picture'),
            ),
            SizedBox(height: 20),
            Text(_rgbValue),
          ],
        ),
      ),
    );
  }
}

