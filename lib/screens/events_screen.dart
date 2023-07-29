import 'dart:convert';

import 'package:blog_app/screens/add_event_screen.dart';
import 'package:blog_app/screens/single_event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../services/user_service.dart';

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
    String token = await getToken();
    final response = await http.get(
      Uri.parse(eventsURL),
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $token'
      // },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        setState(() {
          events = jsonData.map((data) => Event.fromJson(data)).toList();
        });
      } else {
        // Handle error when the response is not a List.
        // Show an error message or perform appropriate error handling.
      }
    } else {
      print(response.statusCode);
      // Handle error response.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Events'),
      // ),
      body: ListView.separated(
        itemCount: events.length,
        itemBuilder: (context, index) {
          Event event = events[index];
          return ListTile(
            leading: Icon(
              Icons.event,
              color: Colors.orange,
            ),
            title: Text(
              event.eventName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(event.eventDescription),
            trailing: Icon(Icons.arrow_forward_sharp, color: Colors.orange),
            onTap: () {
              // Navigate to the EventDetailScreen when the event is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailScreen(event: event),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 0.2, // Adjust the thickness of the line as needed.
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushAndRemoveUntil(
      //         MaterialPageRoute(builder: (context) => AddEventScreen()),
      //         (route) => false);
      //   },
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddEventScreen()));
          },
          child: Icon(
            Icons.calendar_month,
            color: Color.fromARGB(218, 228, 135, 4),
          ),
          backgroundColor: Colors.black),
    );
  }
}
