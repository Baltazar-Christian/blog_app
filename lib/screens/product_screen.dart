import 'package:blog_app/constant.dart';
import 'package:blog_app/models/api_response.dart';
// import 'package:blog_app/models/post.dart';
// import 'package:blog_app/screens/comment_screen.dart';
import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_provider.dart';
import 'event_detail_screen.dart';
import 'login.dart';
// import 'post_form.dart';

class ProductScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<ProductScreen> {
  List<dynamic> _postList = [];
  int userId = 0;
  bool _loading = true;

  // get all posts
  Future<void> retrievePosts() async {
    userId = await getUserId();
    ApiResponse response = await getProducts();

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

  void _handleDeletePost(int postId) async {
    ApiResponse response = await deletePost(postId);
    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // post like dislik
  void _handlePostLikeDislike(int postId) async {
    ApiResponse response = await likeUnlikePost(postId);

    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    retrievePosts();
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
              return retrievePosts();
            },
            child: ListView.builder(
              itemCount: _postList.length,
              itemBuilder: (context, index) {
                final product = _postList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product.image),
                    title: Text(product.body),
                    subtitle: Text('Price: ' + product.price),
                    trailing: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Navigate to the product details screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: _postList[index]),
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
                              ProductDetailsScreen(product: _postList[index]),
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
