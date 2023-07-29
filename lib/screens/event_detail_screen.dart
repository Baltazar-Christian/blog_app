import 'package:blog_app/models/product.dart';
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
            color: Colors.orange, // Set the text color to orange
            fontWeight: FontWeight.bold,
          ),
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
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Price: \$${product.price}'),
            SizedBox(height: 16),
            Text(product.name),
          ],
        ),
      ),
    );
  }
}
