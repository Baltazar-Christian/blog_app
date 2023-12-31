// import 'package:flutter/material.dart';

// import '../services/user_service.dart';
// import 'login1.dart';

// class HomeScreen extends StatelessWidget {
//   Future<List<String>> fetchData() async {
//     // Simulate data fetching delay for 2 seconds
//     await Future.delayed(Duration(seconds: 2));

//     // Replace this with your actual data fetching logic
//     return List.generate(3, (index) => 'Event $index');
//   }

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     return FutureBuilder<List<String>>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // While data is being fetched, show a loader or progress indicator
//             return Scaffold(
//               // appBar: AppBar(title: Text('Events App')),
//               body: Center(
//                   child: CircularProgressIndicator(
//                 color: Color.fromARGB(218, 228, 135, 4),
//               )),
//             );
//           } else if (snapshot.hasError) {
//             // If there's an error in fetching data, display an error message
//             return Scaffold(
//               appBar: AppBar(title: Text('Events App')),
//               body: Center(child: Text('Error occurred while fetching data')),
//             );
//           } else {
//             // If data is successfully loaded, display the home screen content
//             final events = snapshot.data!;
//             return Scaffold(
//               // appBar: AppBar(
//               //   leading: Padding(
//               //     padding: const EdgeInsets.all(8.0),
//               //     child: Image.asset(
//               //       'assets/logo.png', // Replace this with the actual path of your logo image
//               //       fit: BoxFit
//               //           .contain, // Adjust the logo's size to fit within the AppBar
//               //     ),
//               //   ),
//               //   backgroundColor: Color.fromARGB(255, 26, 25, 25),
//               //   actions: [
//               //     IconButton(
//               //       onPressed: () {
//               //         logout().then((value) => {
//               //               Navigator.of(context).pushAndRemoveUntil(
//               //                   MaterialPageRoute(
//               //                       builder: (context) => Login()),
//               //                   (route) => false)
//               //             });
//               //       },
//               //       icon: Icon(
//               //         Icons.exit_to_app,
//               //         color: Color.fromARGB(218, 228, 135, 4),
//               //       ),
//               //     )
//               //   ],
//               // ),
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Header Section
//                     Container(
//                       padding: EdgeInsets.all(1),
//                       // decoration: BoxDecoration(
//                       //   gradient: LinearGradient(
//                       //     colors: [Colors.blue, Colors.indigo],
//                       //     begin: Alignment.topCenter,
//                       //     end: Alignment.bottomCenter,
//                       //   ),
//                       // ),
//                       //   child: Center(
//                       //     child: Text(
//                       //       '',
//                       //       style: TextStyle(
//                       //         fontSize: 10,
//                       //         fontWeight: FontWeight.bold,
//                       //         color: Colors.white,
//                       //         backgroundColor: Color.fromARGB(255, 26, 25, 25),
//                       //       ),
//                       //     ),
//                       //   ),
//                     ),

//                     // Upcoming Events Section
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         'Upcoming Events',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return EventCard(
//                             eventName: 'Event $index',
//                             eventDate: 'Event Date $index',
//                             eventLocation: 'Event Location $index',
//                           );
//                         },
//                       ),
//                     ),

//                     // Featured Event Section
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         'Featured Event',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     FeaturedEventCard(
//                       eventName: 'Featured Event Name',
//                       eventDate: 'Featured Event Date',
//                       eventLocation: 'Featured Event Location',
//                       // Add image property for the featured event image
//                       // Replace with your featured event image
//                       // image: AssetImage('assets/featured_event.jpg'),
//                     ),

//                     // Quick Actions Section
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           QuickActionButton(
//                             label: 'Create New Event', onPressed: () {},
//                             // Add onPressed callback for the action
//                           ),
//                           QuickActionButton(
//                             label: 'Explore All Events', onPressed: () {},
//                             // Add onPressed callback for the action
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Categories or Filters Section
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           FilterButton(label: 'Category 1'),
//                           FilterButton(label: 'Category 2'),
//                         ],
//                       ),
//                     ),

//                     // Event Recommendations Section
//                     Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         'Event Recommendations',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return EventCard(
//                             eventName: 'Recommendation $index',
//                             eventDate: 'Recommendation Date $index',
//                             eventLocation: 'Recommendation Location $index',
//                           );
//                         },
//                       ),
//                     ),

//                     // Footer or Bottom Navigation Section
//                   ],
//                 ),
//               ),
//             );
//           }
//         });
//   }
// }

// class EventCard extends StatelessWidget {
//   final String eventName;
//   final String eventDate;
//   final String eventLocation;

//   EventCard({
//     required this.eventName,
//     required this.eventDate,
//     required this.eventLocation,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 3,
//       child: Container(
//         width: 200,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(218, 249, 221, 182),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               eventName,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               eventDate,
//               style: TextStyle(fontSize: 14),
//             ),
//             SizedBox(height: 4),
//             Text(
//               eventLocation,
//               style: TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FeaturedEventCard extends StatelessWidget {
//   final String eventName;
//   final String eventDate;
//   final String eventLocation;
//   // Add 'image' property for the featured event image

//   FeaturedEventCard({
//     required this.eventName,
//     required this.eventDate,
//     required this.eventLocation,
//     // Add 'this.image' to the constructor
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: Color.fromARGB(218, 249, 221, 182),
//       elevation: 3,
//       child: Container(
//         width: 300,
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display featured event image here using Image widget
//             // Image(image: image),
//             Text(
//               eventName,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               eventDate,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 8),
//             Text(
//               eventLocation,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors
//                     .black, // Change the button background color to orange
//                 onPrimary: Color.fromARGB(
//                     218, 228, 135, 4), // Change the button text color to black
//               ),
//               onPressed: () {
//                 // Implement navigation to event detail screen here
//               },
//               child: Text('View Details'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class QuickActionButton extends StatefulWidget {
//   final String label;
//   final VoidCallback onPressed;

//   QuickActionButton({
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   _QuickActionButtonState createState() => _QuickActionButtonState();
// }

// class _QuickActionButtonState extends State<QuickActionButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _scaleAnimation,
//       child: ElevatedButton(
//         onPressed: () {
//           _animationController.forward();
//           // Perform the action or navigate to the respective screen
//           widget.onPressed();
//         },
//         child: Text(widget.label),
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),

//           primary: Colors.black, // Change the button background color to orange
//           onPrimary: Color.fromARGB(
//               218, 228, 135, 4), // Change the button text color to black
//         ),
//         // onHighlightChanged: (isHighlighted) {
//         //   if (!isHighlighted) {
//         //     _animationController.reverse();
//         //   }
//         // },
//       ),
//     );
//   }
// }

// class FilterButton extends StatelessWidget {
//   final String label;

//   FilterButton({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: () {
//         // Implement action when the filter button is pressed
//       },
//       child: Text(label),
//     );
//   }
// }
