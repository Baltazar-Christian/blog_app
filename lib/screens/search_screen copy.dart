import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: searchController,
              style: TextStyle(color: Colors.black), // Default text color
              cursorColor: Color.fromARGB(218, 228, 135, 4), //
              decoration: InputDecoration(
                hintText: 'Enter Text Here..',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(218, 228, 135, 4),
                ),
                border: OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(218, 228, 135,
                          4)), // Border color when the field is in focus
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Perform search logic here, e.g., call API or display results.
                String query = searchController.text;
                print('Searching for: $query');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set the button color to black
              ),
              child: Text(
                'Search',
                style: TextStyle(
                    color: Color.fromARGB(
                        218, 228, 135, 4)), // Set the text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
