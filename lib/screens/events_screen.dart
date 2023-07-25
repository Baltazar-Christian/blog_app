import 'dart:convert';

import 'package:blog_app/screens/add_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Event {
  final int id;
  final String eventName;
  final String eventDescription;
  final DateTime startDate;
  final DateTime endDate;

  Event({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.startDate,
    required this.endDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      eventName: json['event_name'],
      eventDescription: json['event_description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }
}

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<Event> events = [];
  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(
      Uri.parse('http://your-laravel-api-url/api/events'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        events = jsonData.map((data) => Event.fromJson(data)).toList();
      });
    } else {
      // Handle error response.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Events'),
      // ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          Event event = events[index];
          return ListTile(
            title: Text(event.eventName),
            subtitle: Text(event.eventDescription),
            trailing: Icon(Icons.event),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AddEventScreen()),
              (route) => false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
