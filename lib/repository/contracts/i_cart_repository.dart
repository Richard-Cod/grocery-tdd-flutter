import 'package:grocery/models/cart.dart';
import 'package:grocery/models/product.dart';

import '../../models/product.dart';

class ICartRepository {
  ICartRepository();
  Future<void> addProduct(Cart cart, Product product,
      {int quantityToIncrease = 1}) {
    throw UnimplementedError();
  }

  Future<void> removeProduct(Cart cart, Product product) async {}

  Future<void> clearCart(Cart cart) async {}
}
