import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final String title;
  final String time;

   // Constructor
  RecipePage({Key? key, required this.title, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Header 
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
          // Body and buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Colors.teal[50],
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/francesinha.jpeg', // Replace with your image asset path
                            height: 200, // Adjust the size accordingly
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ingredients:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Pão de forma',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            '(1) Lorem ipsum dolor sit amet consectetur.\n(2) Egestas ultrices sed ullamcorper dictum vestibulum vitae eleifend cras. Sapientincidunt iaculis at nam. In et elementum etiam est maecenas egestas anean gravida. Pellentesque aliquam aenean suspendisse sed.',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Buttons
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

