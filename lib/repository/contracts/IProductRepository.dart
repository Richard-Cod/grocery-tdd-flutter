import 'package:grocery/models/product.dart';

import '../../models/product.dart';

class IProductRepository {
  IProductRepository();
  Future<List<Product>> getAllProducts() {
    throw UnimplementedError();
  }

  Future<List<Product>> getProductsFilteredByTitle(String title) {
    throw UnimplementedError();
  }

  Future<Product> getProductDetail(int id) {
    throw UnimplementedError();
  }
}
