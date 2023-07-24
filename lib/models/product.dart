// import 'user.dart';

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
  });

// map json to post model

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image_url'],
        price: json['price']);
  }
}
