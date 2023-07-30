import 'package:flutter/material.dart';

import '../services/user_service.dart';
import 'login1.dart';

class HomeScreen extends StatelessWidget {
  Future<List<String>> fetchData() async {
    // Simulate data fetching delay for 2 seconds
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual data fetching logic
    return List.generate(3, (index) => 'Event $index');
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder<List<String>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loader or progress indicator
            return Scaffold(
              // appBar: AppBar(title: Text('Events App')),
              body: Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(218, 228, 135, 4),
              )),
            );
          } else if (snapshot.hasError) {
            // If there's an error in fetching data, display an error message
            return Scaffold(
              appBar: AppBar(title: Text('Events App')),
              body: Center(child: Text('Error occurred while fetching data')),
            );
          } else {
            // If data is successfully loaded, display the home screen content
            final events = snapshot.data!;
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header Section
                    Container(
                      padding: EdgeInsets.all(1),
                    ),

                    // Upcoming Events Section
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        // Use Row to display Icon and Text together
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              color: Colors.orange), // Add Icon before the Text
                          SizedBox(
                              width: 8), // Add some space between Icon and Text
                          Text(
                            'Upcoming Events',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 200,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //       return EventCard(
                    //         eventName: 'Event $index',
                    //         eventDate: 'Event Date $index',
                    //         eventLocation: 'Event Location $index',
                    //       );
                    //     },
                    //   ),
                    // ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/muic.jpeg'), // Replace with the image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/upcoming_events_bg.jpg'), // Replace with the image asset path
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            return EventCard(
                              eventName: events[index],
                              eventDate: 'Event Date $index',
                              eventLocation: 'Event Location $index',
                              // Add the background image for each event card
                              image: AssetImage('assets/images/music.jpeg'),
                              eventId: 1,
                            );
                          },
                        ),
                      ),
                    ),

                    // Featured Event Section
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(// Use Row to display Icon and Text together
                          children: [
                        Icon(Icons.star,
                            color: Colors.orange), // Add Icon before the Text
                        SizedBox(
                            width: 8), // Add some space between Icon and Text
                        Text(
                          'Featured Event',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),

                    FeaturedEventCard(
                      eventName: 'Featured Event Name',
                      eventDate: 'Featured Event Date',
                      eventLocation: 'Featured Event Location',
                      // Add image property for the featured event image
                      // Replace with your featured event image
                      // image: AssetImage('assets/featured_event.jpg'),
                    ),

                    // Quick Actions Section
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuickActionButton(
                            label: 'Create New Event', onPressed: () {},
                            // Add onPressed callback for the action
                          ),
                          QuickActionButton(
                            label: 'Explore All Events', onPressed: () {},
                            // Add onPressed callback for the action
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final ImageProvider image; // Image property for the background image
  final int eventId; // Event ID for redirection

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.image, // Initialize the image property
    required this.eventId, // Initialize the event ID
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Stack(
        children: [
          // Background Image
          Container(
            width: 170,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: image, // Set the background image for each event card
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Implement action when the view event detail button is pressed
                    // For now, it will just show a simple popup message
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsScreen(eventId: eventId),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          // Event Details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(218, 249, 221, 182),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // SizedBox(height: 4),
                  // Text(
                  //   eventDate,
                  //   style: TextStyle(fontSize: 14, color: Colors.black38),
                  // ),
                  // SizedBox(height: 4),
                  // Text(
                  //   eventLocation,
                  //   style: TextStyle(fontSize: 10, color: Colors.black38),
                  // ),
                  // SizedBox(height: 8),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Implement navigation to the specific event screen here
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //             EventDetailsScreen(eventId: eventId),
                  //       ),
                  //     );
                  //   },
                  //   child: Text('View Event Details'),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.black,
                  //     onPrimary: Color.fromARGB(218, 228, 135, 4),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final int eventId;

  EventDetailsScreen({required this.eventId});

  @override
  Widget build(BuildContext context) {
    // You can implement the event details screen here
    // Use the 'eventId' to fetch the specific event details and display them on the screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Colors.black, // Set the app bar background to black
      ),
      body: Center(
        child: Text('Event Details for Event $eventId'),
      ),
    );
  }
}

class FeaturedEventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;
  // Add 'image' property for the featured event image

  FeaturedEventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    // Add 'this.image' to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromARGB(218, 249, 221, 182),
      elevation: 3,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display featured event image here using Image widget
            // Image(image: image),
            Text(
              eventName,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              eventDate,
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
            SizedBox(height: 8),
            Text(
              eventLocation,
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .black, // Change the button background color to orange
                onPrimary: Color.fromARGB(
                    218, 228, 135, 4), // Change the button text color to black
              ),
              onPressed: () {
                // Implement navigation to event detail screen here
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActionButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  QuickActionButton({
    required this.label,
    required this.onPressed,
  });

  @override
  _QuickActionButtonState createState() => _QuickActionButtonState();
}

class _QuickActionButtonState extends State<QuickActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ElevatedButton(
        onPressed: () {
          _animationController.forward();
          // Perform the action or navigate to the respective screen
          widget.onPressed();
        },
        child: Text(widget.label),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),

          primary: Color.fromARGB(
              218, 228, 135, 4), // Change the button background color to orange
          onPrimary: Colors.black, // Change the button text color to black
        ),
        // onHighlightChanged: (isHighlighted) {
        //   if (!isHighlighted) {
        //     _animationController.reverse();
        //   }
        // },
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;

  FilterButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Implement action when the filter button is pressed
      },
      child: Text(label),
    );
  }
}
