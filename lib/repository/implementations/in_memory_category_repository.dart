import 'package:grocery/core/get_json.dart';
import 'package:grocery/models/category.dart';
import 'package:grocery/repository/contracts/i_category_repository.dart';

class InMemoryCategoryRepository implements ICategoryRepository {
  Future<List<Category>> _getCategories() async {
    final data = await getJson("categories.json");
    return Future.value(Category.buildCategorys(data));
  }

  @override
  Future<List<Category>> getAllCategories() {
    return Future.value(_getCategories());
  }

  @override
  Future<Category> getCategoryDetail(int id) async {
    final List<Category> categories = await _getCategories();
    return Future.value(categories.firstWhere((element) => element.id == id));
  }
}
