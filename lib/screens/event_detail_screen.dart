import 'package:blog_app/models/post.dart';
import 'package:flutter/material.dart';

// import 'events_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Detail',
          style: TextStyle(
              color: Color.fromARGB(
                  218, 228, 135, 4), // Replace with your desired text color
              fontSize: 20),
        ),
        iconTheme: IconThemeData(
            color: Color.fromARGB(218, 228, 135, 4)), // Set the color here

        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product.body,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Text('Price: \$${product.price.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            Text(product.body),
          ],
        ),
      ),
    );
  }
}
