import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue, // Replace with your color or gradient
              child: Center(
                child: Text(
                  'App Logo',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Upcoming Events Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200, // Adjust the height as per your design
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Replace with the actual number of events
                itemBuilder: (context, index) {
                  return EventCard(
                    eventName: 'Event $index',
                    eventDate: 'Event Date $index',
                    eventLocation: 'Event Location $index',
                  );
                },
              ),
            ),

            // Featured Event Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Featured Event',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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

            // Categories or Filters Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterButton(label: 'Category 1'),
                  FilterButton(label: 'Category 2'),
                ],
              ),
            ),

            // Event Recommendations Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Event Recommendations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200, // Adjust the height as per your design
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    3, // Replace with the actual number of recommended events
                itemBuilder: (context, index) {
                  return EventCard(
                    eventName: 'Recommendation $index',
                    eventDate: 'Recommendation Date $index',
                    eventLocation: 'Recommendation Location $index',
                  );
                },
              ),
            ),

            // Footer or Bottom Navigation Section
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event), label: 'Events'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(eventName),
          Text(eventDate),
          Text(eventLocation),
        ],
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display featured event image here using Image widget
          // Image(image: image),
          Text(eventName),
          Text(eventDate),
          Text(eventLocation),
          // Add 'View Details' button/icon here
        ],
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  QuickActionButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
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
