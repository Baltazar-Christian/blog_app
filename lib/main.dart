import 'package:flutter/material.dart';

import 'screens/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(
            255, 26, 25, 25), // Set the background color to black
        textTheme: const TextTheme(
          bodyText1:
              TextStyle(color: Colors.orange), // Set the text color to orange
          bodyText2: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline1: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline2: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline3: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline4: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline5: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          headline6: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          subtitle1: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          subtitle2: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          button: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          caption: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
          overline: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
            color:
                Colors.black), // Set the BottomAppBar background color to black
      ),
      home: Loading(),
    );
  }
}
