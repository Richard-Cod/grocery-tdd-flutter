import 'package:grocery/models/Cart.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/ICartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryCartRepository.dart';
import 'package:grocery/repository/implementations/InMemoryProductRepository.dart';
import 'package:test/test.dart';

void main() {
  ICartRepository repo;
  test('Add Product to cart', () async {
    repo = InMemoryCartRepository();
    List<Product> products = await InMemoryProductRepository().getAllProducts();

    final cart = Cart(id: 1, cartItems: []);

    await repo.addProduct(cart, products[1]);

    expect(cart.cartItems, isNotEmpty);

    await repo.addProduct(cart, products[1]);
    await repo.addProduct(cart, products[1]);

    expect(cart.cartItems.length, 1);

    final cartItem = cart.cartItems
        .firstWhere((element) => element.product.id == products[1].id);

    expect(cartItem.quantity, 3);
  });

  test('Add Product to cart by quantity', () async {
    repo = InMemoryCartRepository();
    List<Product> products = await InMemoryProductRepository().getAllProducts();

    final cart = Cart(id: 1, cartItems: []);
    await repo.addProduct(cart, products[1], quantityToIncrease: 10);

    final cartItem = cart.cartItems
        .firstWhere((element) => element.product.id == products[1].id);

    expect(cartItem.quantity, 10);
  });
}
