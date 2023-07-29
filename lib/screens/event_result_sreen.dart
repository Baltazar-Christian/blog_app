import 'package:flutter/material.dart';

class EventResultScreen extends StatelessWidget {
  final String selectedOption;

  EventResultScreen({required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    // Implement the logic to fetch events data under the selected option.
    // For demonstration purposes, we will use a placeholder list of events.
    List<String> eventsList = [
      'Event 1',
      'Event 2',
      'Event 3',
      // Add more events here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Events under $selectedOption'),
      ),
      body: ListView.builder(
        itemCount: eventsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(eventsList[index]),
            // Implement navigation to event details screen
            onTap: () {
              // Implement navigation to event details screen for the selected event.
            },
          );
        },
      ),
    );
  }
}
