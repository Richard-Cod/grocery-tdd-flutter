import 'package:grocery/models/product.dart';

class CartItem {
  int id;
  int cartId;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.cartId,
    required this.quantity,
    required this.product,
  });

  static List<CartItem> buildCartItems(dynamic jsonArray) {
    List<CartItem> result = [];
    for (var el in jsonArray) {
      result.add(CartItem.fromJson(el));
    }
    return result;
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      cartId: json['cartId'],
      quantity: json['quantity'],
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cartId'] = cartId;
    data['product'] = product;
    return data;
  }
}
