import 'package:blog_app/screens/post_screen.dart';
import 'package:blog_app/screens/product_screen.dart';
// import 'package:blog_app/screens/product_screen%20copy.dart';
import 'package:blog_app/screens/profile.dart';
import 'package:blog_app/screens/venues_screen.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:flutter/material.dart';

import 'add_event_screen.dart';
// import 'add_event_screen3.dart';
import 'events_screen.dart';
import 'home_screen.dart';
import 'login.dart';
// import 'post_form.dart';
// import 'search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Image.asset(
        //       'assets/logo.png', // Replace this with the actual path of your logo image
        //       fit: BoxFit
        //           .contain, // Adjust the logo's size to fit within the AppBar
        //     ),
        //   ),
        //   backgroundColor: Colors.black,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         logout().then((value) => {
        //               Navigator.of(context).pushAndRemoveUntil(
        //                   MaterialPageRoute(builder: (context) => Login()),
        //                   (route) => false)
        //             });
        //       },
        //       icon: Icon(
        //         Icons.exit_to_app,
        //         color: Color.fromARGB(218, 228, 135, 4),
        //       ),
        //     )
        //   ],
        // ),

        // body: currentIndex == 0 ? PostScreen() : Profile(),
        body: PageView(
          controller: _pageController,
          children: [
            Center(child: HomeScreen()),
            Center(child: PostScreen()),
            Center(child: EventsScreen()),
            Center(child: VenuesScreen()),
            Center(child: Profile()),
          ],
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => PostForm(
        //                 title: 'Add new post',
        //               )));
        //     },
        //     child: Icon(
        //       Icons.calendar_month,
        //       color: Color.fromARGB(218, 228, 135, 4),
        //     ),
        //     backgroundColor: Colors.black),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child:
              // BottomNavigationBar(
              //   items: [
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.calendar_month), label: ''),
              //     // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              //     BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
              //   ],
              //   currentIndex: currentIndex,
              //   selectedItemColor: Color.fromARGB(218, 228, 135, 4),
              //   onTap: (val) {
              //     setState(() {
              //       currentIndex = val;
              //     });
              //   },
              // ),
              BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black38),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.airplay,
                  color: Colors.black38,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment, color: Colors.black38),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group, color: Colors.black38),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black38),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromARGB(218, 228, 135, 4),
            onTap: _onItemTapped,
            backgroundColor: Colors.black,
          ),
        ));
  }
}
