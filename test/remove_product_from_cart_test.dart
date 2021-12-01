import 'package:grocery/models/cart.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_cart_repository.dart';
import 'package:grocery/repository/implementations/in_memory_cart_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
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
