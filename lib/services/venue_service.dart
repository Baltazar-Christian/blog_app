// import 'dart:convert';

import 'dart:convert';

import 'package:blog_app/models/api_response.dart';
import 'package:blog_app/models/venue.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

// get all posts
Future<ApiResponse> getVenues() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(venuesURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response.body);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['venues']
            .map((p) => Venue.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}
