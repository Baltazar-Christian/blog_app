import 'package:blog_app/constant.dart';
import 'package:blog_app/models/api_response.dart';
// import 'package:blog_app/services/post_service.dart';
import 'package:blog_app/services/product_provider.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:flutter/material.dart';

// import '../models/product.dart';
import 'login1.dart';
// import 'post_form.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> _productList = [];
  // int userId = 0;
  bool _loading = true;

  // get all posts
  Future<void> retrieveProducts() async {
    // userId = await getUserId();
    ApiResponse response = await getProducts();

    if (response.error == null) {
      setState(() {
        _productList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
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
    retrieveProducts();
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
              return retrieveProducts();
            },
            child: ListView.builder(
              itemCount: _productList.length,
              itemBuilder: (context, index) {
                final product = _productList[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle:
                        Text('Price: \$${product.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Navigate to the product details screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         ProductDetailsScreen(product: product),
                        //   ),
                        // );
                      },
                    ),
                    onTap: () {
                      // Navigate to the product details screen (same as tapping the trailing icon)
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         ProductDetailsScreen(product: product),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          );
  }
}
