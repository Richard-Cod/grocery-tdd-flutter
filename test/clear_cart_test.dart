import 'package:grocery/models/Cart.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/ICartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryCartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryProductRepository.dart';
import 'package:test/test.dart';

void main() {
  ICartRepository repo;
  test('Clear cart', () async {
    repo = InMemoryCartRepository();
    List<Product> products = await InMemoryProductRepository().getAllProducts();
    final cart = Cart(id: 1, cartItems: []);

    await repo.addProduct(cart, products[1]);
    await repo.addProduct(cart, products[2]);
    await repo.addProduct(cart, products[3]);

    await repo.clearCart(cart);

    expect(cart.cartItems, isEmpty);
  });
}
