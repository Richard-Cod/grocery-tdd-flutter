import 'package:flutter/foundation.dart';
import 'package:grocery/utils/StateHelper.dart';

class RegisterSM with ChangeNotifier, DiagnosticableTreeMixin {
  late StateHelper registerSH;
  List<String> _errors = [];

  RegisterSM() {
    registerSH = StateHelper();
  }

  void addError({String? error}) {
    if (!_errors.contains(error)) _errors.add(error!);
    notifyListeners();
  }

  void removeError({String? error}) {
    if (errors.contains(error)) _errors.remove(error);
    notifyListeners();
  }

  List<String?> get errors => _errors;

  void registerWithGoogle() {
    print("registerWithGoogle");
  }

  void registerWithFacebook() {
    print("registerWithFacebook");
  }
}
