class Product {
  int id;
  String title;
  String image;
  int price;
  String description;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });

  static List<Product> buildProducts(dynamic jsonArray) {
    List<Product> result = [];
    for (var el in jsonArray) {
      result.add(Product.fromJson(el));
    }
    return result;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
