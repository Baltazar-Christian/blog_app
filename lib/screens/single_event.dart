import 'package:blog_app/screens/events_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class EventDetailScreen extends StatelessWidget {
  final Event event;

  EventDetailScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(218, 249, 151, 13),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    event.eventName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    event.eventDescription,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EventInfoCard(
                  icon: Icons.event,
                  label: 'Start Date',
                  value: DateFormat('EEE, MMM d, y').format(event.startDate),
                ),
                SizedBox(width: 16), // Add some spacing between the cards
                EventInfoCard(
                  icon: Icons.event_busy,
                  label: 'End Date',
                  value: DateFormat('EEE, MMM d, y').format(event.endDate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  EventInfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 140,
      decoration: BoxDecoration(
        color: Color.fromARGB(218, 249, 221, 182),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
