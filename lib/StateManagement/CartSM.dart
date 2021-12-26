import 'package:flutter/foundation.dart';
import 'package:grocery/repository/implementations/in_memory_cart_repository.dart';
import 'package:grocery/utils/StateHelper.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import '../repository/implementations/in_memory_product_repository.dart';

class CartSM with ChangeNotifier, DiagnosticableTreeMixin {
  final cartRepo = InMemoryCartRepository();
  final cartState = StateHelper();
  late Cart _cart;

  CartSM() {
    _cart = new Cart(id: 1, cartItems: []);
    setCart();
  }

  setCart() async {
    try {
      cartState.loading = true;
      final repoProduct = await InMemoryProductRepository().getAllProducts();
      final cartItem1 =
          CartItem(cartId: 1, quantity: 2, id: 1, product: repoProduct[0]);
      final cartItem2 =
          CartItem(cartId: 1, quantity: 4, id: 2, product: repoProduct[1]);
      _cart = Cart(cartItems: [cartItem1, cartItem2], id: 1);

      cartState.data = _cart;

      cartState.loading = false;
    } catch (e) {
      cartState.error = true;
    }
  }

  incrementProductQuantity(CartItem cartItem) {
    cartRepo.addProduct(cart, cartItem.product);
    notifyListeners();
  }

  decrementProductQuantity(CartItem cartItem) {
    cartRepo.decreaseProductQuantity(cart, cartItem.product);
    notifyListeners();
  }

  Cart get cart => _cart;

  void removeProduct(CartItem cartItem) {
    cartRepo.removeProduct(cart, cartItem.product);
    notifyListeners();
  }
}
