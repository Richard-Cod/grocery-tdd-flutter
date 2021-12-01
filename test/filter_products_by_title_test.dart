import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_product_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
import 'package:test/test.dart';

void main() {
  IProductRepository repo;
  test('Filter products by titles', () async {
    repo = InMemoryProductRepository();
    final products = await repo.getProductsFilteredByTitle("egg");
    expect(products, isNotEmpty);

    for (Product product in products) {
      expect(product.price, 23);
    }
  });
}
