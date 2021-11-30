import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/IProductRepository.dart';
import 'package:grocery/repository/implementations/InMemoryProductRepository.dart';
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
