import 'package:blog_app/constant.dart';
import 'package:blog_app/models/api_response.dart';
import 'package:blog_app/screens/venue_detail_screen.dart';
// import 'package:blog_app/models/post.dart';
// import 'package:blog_app/screens/comment_screen.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:blog_app/services/venue_service.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_provider.dart';
import 'event_detail_screen.dart';
import 'login1.dart';
// import 'post_form.dart';

class VenuesScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<VenuesScreen> {
  List<dynamic> _postList = [];
  int userId = 0;
  bool _loading = true;

  // get all posts
  Future<void> retrieveVenues() async {
    userId = await getUserId();
    ApiResponse response = await getVenues();

    if (response.error == null) {
      // print(response.data);
      setState(() {
        _postList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });

      // setState(() {
      //   _postList = List.from(response.jsonData.map((data) => Product(
      //         name: data['name'],
      //         description: data['description'],
      //         image: data['imageUrl'],
      //         price: data['price'].toDouble(),
      //       )));
      //   _loading = _loading ? !_loading : _loading;
      // });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  void initState() {
    retrieveVenues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(
            color: Color.fromARGB(218, 228, 135, 4),
            // backgroundColor: Colors.black,
          ))
        : RefreshIndicator(
            onRefresh: () {
              return retrieveVenues();
            },
            child: ListView.builder(
              itemCount: _postList.length,
              itemBuilder: (context, index) {
                final product = _postList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product.image),
                    title: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: ' + product.price),
                    trailing: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Navigate to the product details screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VenueDetailsScreen(product: _postList[index]),
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
                              VenueDetailsScreen(product: _postList[index]),
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
