import 'package:flutter/foundation.dart';
import 'package:grocery/utils/StateHelper.dart';
import '../repository/implementations/in_memory_product_repository.dart';

class HomeSM with ChangeNotifier, DiagnosticableTreeMixin {
  final productRepo = InMemoryProductRepository();
  List<int> _notifications = [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6];
  late StateHelper popularProductsSH;

  HomeSM() {
    popularProductsSH = StateHelper();
    setPopularProducts();
  }

  Future<dynamic> setPopularProducts() async {
    try {
      popularProductsSH.loading = true;
      notifyListeners();
      popularProductsSH.data = await productRepo.getAllProducts();
      popularProductsSH.loading = false;
    } catch (e) {
      popularProductsSH.error = e;
    } finally {
      notifyListeners();
    }
  }

  List<int> get notifications => _notifications;
}
