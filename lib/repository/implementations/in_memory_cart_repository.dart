import 'package:grocery/models/cart_item.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/models/cart.dart';
import 'package:grocery/repository/contracts/i_cart_repository.dart';

class InMemoryCartRepository implements ICartRepository {
  @override
  Future<void> addProduct(Cart cart, Product product,
      {int quantityToIncrease = 1}) async {
    final int index = cart.cartItems
        .indexWhere((element) => element.product.id == product.id);
    final bool productExist = index >= 0;

    if (productExist) {
      cart.cartItems[index].quantity += quantityToIncrease;
    } else {
      cart.cartItems.add(CartItem(
          id: 1, cartId: 1, quantity: quantityToIncrease, product: product));
    }
  }

  @override
  Future<void> removeProduct(Cart cart, Product product) async {
    final int index = cart.cartItems
        .indexWhere((element) => element.product.id == product.id);

    final bool cartItemExist = index >= 0;

    if (cartItemExist) {
      cart.cartItems.remove(cart.cartItems[index]);
    }
  }

  @override
  Future<void> clearCart(Cart cart) async {
    cart.cartItems.clear();
  }
}
