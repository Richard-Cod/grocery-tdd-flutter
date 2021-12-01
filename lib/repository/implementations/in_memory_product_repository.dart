import 'package:grocery/core/get_json.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_product_repository.dart';

class InMemoryProductRepository implements IProductRepository {
  Future<List<Product>> _getProducts(String path) async {
    final data = await getJson(path);
    return Product.buildProducts(data);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return Future.value(_getProducts("products.json"));
  }

  @override
  Future<Product> getProductDetail(int id) async {
    final List<Product> products = await _getProducts("products.json");
    return Future.value(products.firstWhere((element) => element.id == id));
  }

  @override
  Future<List<Product>> getProductsFilteredByTitle(String title) async {
    final List<Product> products =
        await _getProducts("filterableProducts.json");
    final List<Product> result = [];

    for (Product product in products) {
      final conditions =
          product.title.toUpperCase().contains(title.toUpperCase());

      if (conditions) {
        result.add(product);
      }
    }

    return result;
  }
}
