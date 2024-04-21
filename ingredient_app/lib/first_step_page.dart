import 'package:flutter/material.dart';

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
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: Icon(Icons.camera_alt),
                    backgroundColor: Colors.teal,
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
                        // Navigate to next step
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
                          color: Colors.black54,
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
                          color: Colors.black54,
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
