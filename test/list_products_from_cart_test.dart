import 'package:grocery/models/cart.dart';
import 'package:grocery/models/cart_item.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_cart_repository.dart';
import 'package:grocery/repository/implementations/in_memory_cart_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
import 'package:test/test.dart';

void main() {
  ICartRepository repo;
  test('List Product from cart', () async {
    repo = InMemoryCartRepository();
    List<Product> products = await InMemoryProductRepository().getAllProducts();
    final cart = Cart(id: 1, cartItems: []);

    final cartItem1 =
        CartItem(cartId: cart.id, id: 1, quantity: 1, product: products[1]);

    cart.cartItems.add(cartItem1);

    expect(await repo.getItems(cart), isNotEmpty);
  });
}
