import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/model/user_model.dart';
import 'package:product/model/product_model.dart';
import 'package:product/repository/product_repo.dart';

class ProductController extends GetxController implements GetxService {
  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  UserModel? _userList;
  UserModel? get userList => _userList;

  List<Product> _cartProduct = [];
  List<Product> get cartProduct => _cartProduct;

  List<Product> _deleteproduct = [];
  List<Product> get deleteProduct => _deleteproduct;

  List<Product> _removeSaveList = [];
  List<Product> get removeSaveList => _removeSaveList;

  List<Product> _saveList = [];
  List<Product> get saveList => _saveList;
  double totalPrice = 0;

  final Productrepo productrepo = Productrepo();

  final Userrepo _userrepo = Userrepo();
  bool isLoading = false;

  int getPosition(Product val) {
    final i = _cartProduct.indexWhere((element) => element.id == val.id);
    return i;
  }

  addToCart(Product val, BuildContext context) {
    final position = getPosition(val);
    var subtotal = 0.0;
    if (position > -1) {
      ++_cartProduct[position].quantity;
      subtotal = totalPrice + double.parse("${_cartProduct[position].price}");
      update();
    } else {
      _cartProduct.add(val);
      subtotal = double.parse('${val.price}');
      subtotal = totalPrice;
      update();
    }
    totalPrice = subtotal;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        content: Text('${val.title} Is successfully added to cart'),
      ),
    );
    update();
  }

  increasequantity(Product val) {
    for (int i = 0; i < _cartProduct.length; i++) {
      if (_cartProduct[i] == val) {
        if (val.quantity <= 19) {
          ++_cartProduct[i].quantity;
          totalPrice += _cartProduct[i].price ?? 0;
          update();
        }
      }
    }
  }

  decreasequantity(Product val) {
    for (int i = 0; i < _cartProduct.length; i++) {
      if (_cartProduct[i] == val) {
        if (val.quantity > 0) {
          _cartProduct[i].quantity--;
          totalPrice -= _cartProduct[i].price ?? 0;
          update();
        } else {
          _cartProduct.remove(val);
        }
      }
    }
  }

  getTotalPrice() {
    double t = 0.0;
    for (int i = 0; i < _cartProduct.length; i++) {
      t = t + double.parse("${_cartProduct[i].price}");
    }
    totalPrice = t;
    update();
  }

  getSaveProduct(Product val) {
    _saveList.add(val);
    update();
  }

  removeDeleteProduct(Product val) {
    _cartProduct.remove(val);
    update();
  }

  getremoveSaveList(Product val) {
    _saveList.remove(val);
  }

  Future<void> getProductList() async {
    isLoading = true;
    update();
    Response response = await productrepo.getProductList();
    if (response.statusCode == 200) {
      _productModel = ProductModel.fromJson(response.body);
      isLoading = false;
      update();
    } else {
      return;
    }
  }

  // bool _isItemAlreadyAdded(ProductModel product) =>
  //     productModel.userModel.value.cart!
  //         .where((item) => item.name == product.products)
  //         .isNotEmpty;

  Future<void> getNewsList() async {
    isLoading = true;
    update();
    Response response = await _userrepo.getUserList();
    if (response.statusCode == 200) {
      log('respone::${response.body}');
      _userList = UserModel.fromJson(response.body);
      isLoading = false;
      update();
    } else {
      return;
    }
  }
}
