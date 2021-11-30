import 'package:grocery/models/Cart.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/ICartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryCartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryProductRepository.dart';
import 'package:test/test.dart';

void main() {
  ICartRepository repo;
  test('Delete Product from cart', () async {
    repo = InMemoryCartRepository();
    List<Product> products = await InMemoryProductRepository().getAllProducts();
    final cart = Cart(id: 1, cartItems: []);
    await repo.addProduct(cart, products[1]);
    await repo.removeProduct(cart, products[1]);
    expect(cart.cartItems, isEmpty);
  });
}
