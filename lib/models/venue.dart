// import 'user.dart';

class Venue {
  int? id;
  String? name;
  int? capacity;
  String? address;
  String? description;
  String? image;
  String? price;

  Venue({
    this.id,
    this.name,
    this.capacity,
    this.address,
    this.description,
    this.image,
    this.price,
  });

// map json to post model

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
        id: json['id'],
        name: json['venue_name'],
        capacity: json['capacity'],
        address: json['address'],
        description: json['description'],
        image: json['image'],
        price: json['price']);
  }
}
