import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventsExploreScreen(),
    );
  }
}

class EventsExploreScreen extends StatefulWidget {
  @override
  _EventsExploreScreenState createState() => _EventsExploreScreenState();
}

class _EventsExploreScreenState extends State<EventsExploreScreen> {
  List<String> eventsList = [
    'Music Concert',
    'Art Exhibition',
    'Food Festival',
    'Tech Conference',
    'Fitness Workshop',
    'Movie Premiere',
    'Comedy Show',
    'Fashion Show',
  ];

  List<String> filteredEventsList = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEventsList.addAll(eventsList);
  }

  void _filterEvents(String query) {
    setState(() {
      filteredEventsList = eventsList
          .where((event) => event.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Events Explore'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _filterEvents,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
                hintText: 'Search Events',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(218, 228, 135, 4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(218, 228, 135,
                          4)), // Border color when the field is in focus
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEventsList.length,
              itemBuilder: (context, index) {
                final eventName = filteredEventsList[index];
                return ListTile(
                  title: Text(eventName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventResultScreen(selectedOption: eventName),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
        backgroundColor:
            Colors.black, // Set the appbar background color to black
        title: Text(
          'Events under $selectedOption',
          style: TextStyle(
            color: Colors.orange, // Set the text color to orange
            fontWeight: FontWeight.bold,
          ),
        ),
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
