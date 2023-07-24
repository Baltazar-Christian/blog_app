import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class EventsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<EventsScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://192.168.162.249:8000/api/products'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        products = List.from(jsonData.map((data) => Product(
              name: data['name'],
              description: data['description'],
              imageUrl: data['image_url'],
              price: data['price'].toDouble(),
            )));

        print(products);
      });
    } else {
      // Handle API error here
      print('Error fetching products: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Products Screen'),
      // ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  // Navigate to the product details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: product),
                    ),
                  );
                },
              ),
              onTap: () {
                // Navigate to the product details screen (same as tapping the trailing icon)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
