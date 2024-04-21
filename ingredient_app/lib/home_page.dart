import 'package:flutter/material.dart';
import 'first_step_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage("assets/images/background-image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
            ],
          ),),
        ),
        Column(
        children: <Widget>[
          Expanded(
            child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Home Food Made Easy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,120.0),
                    child: Text(
                      'Find your perfect meal!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(36.0, 0.0, 26.0, 0.0),
                    child: const Padding(
                    padding: EdgeInsets.fromLTRB(16.0,30.0,16.0,16.0),
                    child: Text(
                      'Take a picture of your food items and get a healthy snack on the spot',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2,
                      child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next step
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstStepPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Adjust border radius here
                        ),
                      ),
                      child: const Text(
                        'Start Cooking',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),),
          ),
        ],
      ),],
    ),);
  }
}
