import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_product_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
import 'package:test/test.dart';

void main() {
  IProductRepository repo;
  test('Get list of products from fixtures', () async {
    repo = InMemoryProductRepository();
    final products = await repo.getAllProducts();
    expect(products, isNotEmpty);
  });

  test('Get product of detail from fixture', () async {
    repo = InMemoryProductRepository();
    final Product product = await repo.getProductDetail(2);

    expect(product.title, "Figs");
  });
}
