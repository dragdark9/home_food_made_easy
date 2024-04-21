import 'package:flutter/material.dart';
import 'recipe_page.dart';

class ThirdStepPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Widget> recipes = [
    // THIS IS ALL PLACEHOLDER
    ListTile(
      title: Text('Francesinha à moda do Porto'), 
      trailing: Text('20 min.'),
      onTap: () {
            // Use Navigator to push the SecondPage to the stack
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipePage(title: 'Francesinha à moda do Porto', time: '20min')),
          );
        },
      ),
    ListTile(
      title: Text('Francesinha à moda de Braga'), 
      trailing: Text('20 min.'),
      onTap: () {
            // Use Navigator to push the SecondPage to the stack
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipePage(title: 'Francesinha à moda de Braga', time: '20min')),
          );
        },
      ),
  ];

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
                  // Title
                  const Text(
                    'Step 3 of 3',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Subtitle
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,8.0,8.0,30.0),
                    child: Text(
                      'Choose your recipe!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                      child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
                      child: ListView(
                        children: recipes,
                      )
                  ),),
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

