import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:grocery/core/get_json.dart';
import 'package:grocery/repository/contracts/i_product_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';

class PopularProductsVM {
  Future getData() async {
    final IProductRepository repo = InMemoryProductRepository();
    return repo.getAllProducts();
  }
}
