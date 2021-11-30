import 'package:grocery/models/category.dart';
import 'package:grocery/repository/contracts/ICategoryRepository.dart';
import 'package:grocery/repository/implementations/InMemoryCategoryRepository.dart';
import 'package:test/test.dart';

void main() {
  ICategoryRepository repo;
  test('Get list of categories from fixtures', () async {
    repo = InMemoryCategoryRepository();
    final categories = await repo.getAllCategories();
    expect(categories, isNotEmpty);
  });

  test('Get product of detail from fixture', () async {
    repo = InMemoryCategoryRepository();
    final Category category = await repo.getCategoryDetail(2);

    expect(category.title, "Figs");
  });
}
