import '../../models/category.dart';

class ICategoryRepository {
  ICategoryRepository();
  Future<List<Category>> getAllCategories() {
    throw UnimplementedError();
  }

  Future<Category> getCategoryDetail(int id) {
    throw UnimplementedError();
  }
}
