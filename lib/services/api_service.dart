// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/product.dart';

// class ApiService {
//   static const baseUrl = 'http://192.168.162.249:8000/api';

//   Future<List<Product>> getProducts() async {
//     final response = await http.get(Uri.parse('$baseUrl/products'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       return List.from(jsonData.map((data) => Product(
//             id: data['id'],
//             name: data['name'],
//             description: data['description'],
//             imageUrl: data['imageUrl'],
//             price: data['price'].toDouble(),
//           )));
//     } else {
//       throw Exception('Failed to fetch products');
//     }
//   }
// }
