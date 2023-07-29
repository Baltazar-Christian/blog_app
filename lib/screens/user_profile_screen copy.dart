import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Profile'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://example.com/user_profile_picture.jpg'),
                // Replace with the actual image URL
                backgroundColor: Colors.orange.shade100,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Age: 30',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Location: New York, USA',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Card(
              // decoration: BoxDecoration(
              color: Color.fromARGB(218, 213, 189, 155),
              // borderRadius: BorderRadius.circular(10),
              // ),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferences and Interests',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        InterestChip(label: 'Travel'),
                        InterestChip(label: 'Photography'),
                        InterestChip(label: 'Music'),
                        InterestChip(label: 'Reading'),
                        InterestChip(label: 'Cooking'),
                        InterestChip(label: 'Sports'),
                        InterestChip(label: 'Art'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event Histories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    EventHistoryItem(
                      eventName: 'Music Concert',
                      eventDate: 'May 20, 2023',
                      eventLocation: 'New York, USA',
                    ),
                    EventHistoryItem(
                      eventName: 'Art Exhibition',
                      eventDate: 'June 5, 2023',
                      eventLocation: 'London, UK',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Privacy Settings'),
                      onTap: () {
                        // Implement privacy settings functionality
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit Profile'),
                      onTap: () {
                        // Implement edit profile functionality
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestChip extends StatelessWidget {
  final String label;

  InterestChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.orange.shade500,
    );
  }
}

class EventHistoryItem extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;

  EventHistoryItem({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(eventName),
      subtitle: Text('Date: $eventDate\nLocation: $eventLocation'),
      onTap: () {
        // Implement navigation to event details screen
      },
    );
  }
}
