import 'package:flutter/material.dart'; //default

import 'package:flutter_bloc/flutter_bloc.dart'; //BLoC
import 'package:http/http.dart' as http; //BloC Requests

void main() {
  runApp(MyApp());
}

// class MyWidget extends StatelessWidget { //old initial widget, doesnt update as fetchData() is void
//   @override
//   Widget build(BuildContext context) {
//     final backendBloc = BlocProvider.of<BackendBloc>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter App with Python Backend'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             print("Button pressed");
//             backendBloc.fetchData();
//           },
//           child: Text('Fetch Data from Python Backend'),
//         ),
//       ),
//     );
//   }
// }

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backendBloc = BlocProvider.of<BackendBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App with Python Backend'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                backendBloc.fetchData();
              },
              child: Text('Fetch Data from Python Backend'),
            ),
            BlocBuilder<BackendBloc, String>(
              builder: (context, state) {
                return Text(state.isNotEmpty
                    ? state
                    : "Press the button to fetch data");
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backendBloc = BlocProvider.of<BackendBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App with Python Backend'),
      ),
      body: Center(
        child: BlocBuilder<BackendBloc, String>(
          builder: (context, state) {
            return Text(state);
          },
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => BackendBloc(),
        child: MyWidget(),
      ),
    );
  }
}

////////////////// BLoC //////////////////

class BackendBloc extends Cubit<String> {
  BackendBloc() : super(''); //initialise with empty initial state

  Future<void> fetchData() async {
    print("Fetching data...");
    final response = await http.get(Uri.parse(
        'http://10.0.2.2:5000/api/data')); //get request from python app ; just

    print(response);

    if (response.statusCode == 200) {
      // simple error handling
      emit(response.body);
    } else {
      emit('Failed to fetch data');
    }
  }
}

//////////////////////////////////////////


