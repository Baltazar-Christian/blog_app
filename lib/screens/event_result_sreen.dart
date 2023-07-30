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
        backgroundColor:
            Colors.black, // Set the appbar background color to black
        iconTheme: IconThemeData(
            color: Colors.orange), // Set the back icon color to orange
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

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        backgroundColor:
            Colors.black, // Set the appbar background color to black
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Explore Options Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExploreOptionCard(
                    optionTitle: 'Category 1',
                    optionImage:
                        'assets/category1.jpg', // Replace with the image asset path
                    onPressed: () {
                      // Implement navigation to the result screen for Category 1
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventResultScreen(selectedOption: 'Category 1'),
                        ),
                      );
                    },
                  ),
                  ExploreOptionCard(
                    optionTitle: 'Category 2',
                    optionImage:
                        'assets/logo.png', // Replace with the image asset path
                    onPressed: () {
                      // Implement navigation to the result screen for Category 2
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventResultScreen(selectedOption: 'Category 2'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreOptionCard extends StatelessWidget {
  final String optionTitle;
  final String optionImage;
  final VoidCallback onPressed;

  ExploreOptionCard({
    required this.optionTitle,
    required this.optionImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(optionImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Center(
              child: Text(
                optionTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
