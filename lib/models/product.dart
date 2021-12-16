import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  String image;
  int price;
  String description;

  bool isLiked = false;
  double rating = 3;

  List colors = [getColor("#470F0F"), getColor("#F600FF"), getColor("#62F334")];

  static getColor(String colorNormal) {
    return int.parse("FF${colorNormal.substring(1)}", radix: 16);
  }

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.description,
      isLiked,
      rating,
      colors});

  static List<Product> buildProducts(dynamic jsonArray) {
    List<Product> result = [];
    for (var el in jsonArray) {
      result.add(Product.fromJson(el));
    }

    return result;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    // if (json['colors'] != null) {
    //   colors = [];
    //   for (String item in json['colors']) {
    //     colors.add(getColor(item));
    //   }
    // }

    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      isLiked: json['isLiked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    data['isLiked'] = isLiked;
    return data;
  }
}
