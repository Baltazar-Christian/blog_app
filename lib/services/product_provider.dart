// import 'dart:convert';

import 'dart:convert';

import 'package:blog_app/models/api_response.dart';
// import 'package:blog_app/models/post.dart';
import 'package:blog_app/models/product.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

// get all posts
Future<ApiResponse> getProducts() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(productsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        // apiResponse.data = jsonDecode(response.body)['products']
        //     .map((p) => Product.fromJson(p));
        // // we get list of posts, so we need to map each item to post model
        // apiResponse.data as List<dynamic>;
        final jsonData = json.decode(response.body);
        // print(apiResponse.data);
        // apiResponse.data = List.from(jsonData.map((data) => Product(
        //     name: data['name'],
        //     description: data['description'],
        //     image: data['image_url'],
        //     price: data['price'])));
        // print(apiResponse.data);
        apiResponse.data = json.decode(response.body);
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
