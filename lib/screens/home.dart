import 'package:blog_app/screens/events_screen.dart';
import 'package:blog_app/screens/friends_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/post_screen.dart';
import 'package:blog_app/screens/profile.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.black, // Set the background color to black
        textTheme: const TextTheme(
          bodyText1:
              TextStyle(color: Colors.orange), // Set the text color to orange
          // Add more text styles as needed
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png', // Replace this with the actual path of your logo image
            fit: BoxFit
                .contain, // Adjust the logo's size to fit within the AppBar
          ),
        ),
        backgroundColor: Color.fromARGB(255, 26, 25, 25),
        actions: [
          IconButton(
            onPressed: () {
              logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false)
                  });
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(218, 228, 135, 4),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(), // Replace with your screen widgets
          PostScreen(),
          EventsScreen(),
          FriendListScreen(),
          Profile()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 29, 28,
              28), // Set the BottomNavigationBar background color to black
          primaryColor: Colors.orange, // Set the selected item color to orange
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: const TextStyle(
                    color:
                        Colors.grey), // Set the unselected item color to grey
              ),
        ),
        child: BottomNavigationBar(
          //  iconBar background color to black
          selectedItemColor:
              Colors.orange, // Set the selected item color to orange
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
              ),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Events',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Friends',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('Screen 3',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: Text('Screen 4',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
