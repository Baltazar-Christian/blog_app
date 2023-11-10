import 'package:blog_app/screens/events_screen.dart';
import 'package:blog_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant.dart';
import '../services/user_service.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();

  String eventName = '';
  String eventDescription = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void _saveEvent() async {
    if (_formKey.currentState!.validate()) {
      Event newEvent = Event(
        eventName: eventName,
        eventDescription: eventDescription,
        startDate: startDate,
        endDate: endDate,
      );

      // Convert Event object to JSON
      String eventJson = jsonEncode(newEvent);
      var apiResponse;
      try {
        String token = await getToken();
        final response = await http.post(
          Uri.parse(eventsURL),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: eventJson,
        );

        if (response.statusCode == 201) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => EventsScreen()),
              (route) => false);
        } else {
          // Handle error response. You can show an error message to the user.
        }
      } catch (e) {
        print(e);
        // Handle any exceptions that occurred during the HTTP request.
        // You can show an error message or perform any necessary error handling.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Event ',
          style: TextStyle(
              color: Color.fromARGB(
                  218, 228, 135, 4), // Replace with your desired text color
              fontSize: 20 // Optional, adjust the font size as needed
              // Optional, adjust the font weight as needed
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color.fromARGB(218, 228, 135, 4)),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Event Name',
                  style: TextStyle(
                      color: Color.fromARGB(218, 228, 135, 4), fontSize: 16),
                ),
                TextFormField(
                  style: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
                  // Default text color
                  cursorColor: Color.fromARGB(218, 228, 135, 4),
                  decoration: InputDecoration(
                    // labelText: 'Event Name',
                    filled: true,
                    fillColor:
                        Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the event name.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      eventName = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Event Description',
                  style: TextStyle(
                      color: Color.fromARGB(218, 228, 135, 4), fontSize: 16),
                ),
                TextFormField(
                  style: TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
                  // Default text color
                  cursorColor: Color.fromARGB(218, 228, 135, 4),
                  maxLines: 3,
                  // decoration: InputDecoration(labelText: 'Event Description'),
                  decoration: InputDecoration(
                    // labelText: 'Event Name',
                    filled: true,
                    fillColor:
                        Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the event description.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      eventDescription = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                DateTimePicker(
                  labelText: 'Start Date and Time',
                  // labelStyle: (),
                  selectedDate: startDate,
                  selectedTime: TimeOfDay.fromDateTime(startDate),
                  onSelectedDate: (DateTime date) {
                    setState(() {
                      startDate = date;
                    });
                  },
                  onSelectedTime: (TimeOfDay time) {
                    setState(() {
                      startDate = DateTime(
                        startDate.year,
                        startDate.month,
                        startDate.day,
                        time.hour,
                        time.minute,
                      );
                    });
                  },
                ),
                SizedBox(height: 16.0),
                DateTimePicker(
                  labelText: 'End Date and Time',
                  selectedDate: endDate,
                  selectedTime: TimeOfDay.fromDateTime(endDate),
                  onSelectedDate: (DateTime date) {
                    setState(() {
                      endDate = date;
                    });
                  },
                  onSelectedTime: (TimeOfDay time) {
                    setState(() {
                      endDate = DateTime(
                        endDate.year,
                        endDate.month,
                        endDate.day,
                        time.hour,
                        time.minute,
                      );
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _saveEvent,
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .orange, // Change the button background color to orange
                    onPrimary:
                        Colors.black, // Change the button text color to black
                  ),
                  child: Text('Save Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateTimePicker extends StatelessWidget {
  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function(DateTime) onSelectedDate;
  final Function(TimeOfDay) onSelectedTime;

  DateTimePicker({
    required this.labelText,
    required this.selectedDate,
    required this.selectedTime,
    required this.onSelectedDate,
    required this.onSelectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black), // Change the label color to black
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    onSelectedDate(pickedDate);
                  }
                },
                child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null) {
                    onSelectedTime(pickedTime);
                  }
                },
                child: Text(selectedTime.format(context)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Event {
  String? eventName;
  String? eventDescription;
  DateTime? startDate;
  DateTime? endDate;

  Event({
    this.eventName,
    this.eventDescription,
    this.startDate,
    this.endDate,
  });

  // Convert Event object to JSON
  Map<String, dynamic> toJson() {
    return {
      'event_name': eventName,
      'event_description': eventDescription,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
    };
  }
}
