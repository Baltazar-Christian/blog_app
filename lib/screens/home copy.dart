// import 'package:blog_app/screens/friends_screen.dart';
// import 'package:blog_app/screens/post_screen.dart';
// import 'package:blog_app/screens/product_screen.dart';
// // import 'package:blog_app/screens/product_screen%20copy.dart';
// import 'package:blog_app/screens/profile.dart';
// import 'package:blog_app/screens/venues_screen.dart';
// import 'package:blog_app/services/user_service.dart';
// import 'package:flutter/material.dart';

// import 'add_event_screen.dart';
// // import 'add_event_screen3.dart';
// import 'events_screen.dart';
// import 'home_screen.dart';
// import 'login1.dart';
// // import 'post_form.dart';
// // import 'search_screen.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int currentIndex = 0;
//   int _selectedIndex = 0;
//   PageController _pageController = PageController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _pageController.animateToPage(
//         index,
//         duration: Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//           controller: _pageController,
//           children: [
//             Center(child: HomeScreen()),
//             Center(child: PostScreen()),
//             Center(child: EventsScreen()),
//             Center(child: FriendListScreen()),
//             Center(child: Profile()),
//           ],
//           onPageChanged: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//         ),
//         // floatingActionButton: FloatingActionButton(
//         //     onPressed: () {
//         //       Navigator.of(context).push(MaterialPageRoute(
//         //           builder: (context) => PostForm(
//         //                 title: 'Add new post',
//         //               )));
//         //     },
//         //     child: Icon(
//         //       Icons.calendar_month,
//         //       color: Color.fromARGB(218, 228, 135, 4),
//         //     ),
//         //     backgroundColor: Colors.black),
//         // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           color: Color.fromARGB(255, 26, 25, 25),
//           notchMargin: 5,
//           elevation: 10,
//           clipBehavior: Clip.antiAlias,
//           shape: CircularNotchedRectangle(),
//           child:
//               // BottomNavigationBar(
//               //   items: [
//               //     BottomNavigationBarItem(
//               //         icon: Icon(Icons.calendar_month), label: ''),
//               //     // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//               //     BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
//               //   ],
//               //   currentIndex: currentIndex,
//               //   selectedItemColor: Color.fromARGB(218, 228, 135, 4),
//               //   onTap: (val) {
//               //     setState(() {
//               //       currentIndex = val;
//               //     });
//               //   },
//               // ),
//               BottomNavigationBar(
//             /// Set the BottomNavigat
//             /// ionBar background color to black
//             selectedItemColor:
//                 Colors.orange, // Set the selected item color to orange
//             // unselectedItemColor: Colors.grey,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home, color: Colors.black38),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.airplay,
//                   color: Colors.black38,
//                 ),
//                 label: 'Explore',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.assignment, color: Colors.black38),
//                 label: 'Events',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.group, color: Colors.black38),
//                 label: 'Friends',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person, color: Colors.black38),
//                 label: 'Profile',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             // selectedItemColor: Color.fromARGB(218, 228, 135, 4),
//             onTap: _onItemTapped,
//             // backgroundColor: Colors.black,
//           ),
//         ));
//   }
// }
