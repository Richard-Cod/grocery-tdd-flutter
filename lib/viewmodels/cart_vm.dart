import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:grocery/core/get_json.dart';
import 'package:grocery/models/cart_item.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/repository/contracts/i_cart_repository.dart';
import 'package:grocery/repository/contracts/i_product_repository.dart';
import 'package:grocery/repository/implementations/in_memory_cart_repository.dart';
import 'package:grocery/repository/implementations/in_memory_product_repository.dart';
import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';

import '../models/cart.dart';

class CartVM {
  late final Cart cart;
  late final ICartRepository repo;

  CartVM() {
    repo = InMemoryCartRepository();
  }

  Future getData() async {
    return repo.getItems(cart);
  }

  Future removeItem(CartItem cartItem) async {
    return repo.removeProduct(cart, cartItem.product);
  }

  Future<Cart> getCart() async {
    final repoProduct = await InMemoryProductRepository().getAllProducts();
    final cartItem1 =
        CartItem(cartId: 1, quantity: 2, id: 1, product: repoProduct[0]);
    final cartItem2 =
        CartItem(cartId: 1, quantity: 4, id: 2, product: repoProduct[1]);

    cart = new Cart(cartItems: [cartItem1, cartItem2], id: 1);

    return Future.delayed(Duration(seconds: 1), () => cart);
  }

  incrementProductQuantity(CartItem cartItem) {
    repo.addProduct(cart, cartItem.product);
    print(cart.cartItems[0].quantity);
  }

  decrementProductQuantity(CartItem cartItem) {
    // repo.removeProduct(cart, product);
    repo.decreaseProductQuantity(cart, cartItem.product);
    print(cartItem.quantity);
  }
}
