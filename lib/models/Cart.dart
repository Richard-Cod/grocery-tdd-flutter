import 'package:grocery/models/cart_item.dart';

class Cart {
  int id;
  List<CartItem> cartItems;

  Cart({
    required this.id,
    required this.cartItems,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      cartItems: CartItem.buildCartItems(json['cartItems']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cartItems'] = cartItems;
    return data;
  }
}
