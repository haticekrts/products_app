import 'package:flutter/material.dart';
import 'package:products_app/models/cart_item_model.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/models/response_model.dart';
import 'package:products_app/services/product_service.dart';

class ProductRepository extends ChangeNotifier {
  final ProductService productService;
  ProductRepository({required this.productService});

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  ProductModel? _selectedProduct;
  ProductModel? get selectedProduct => _selectedProduct;

  final List<CartItemModel> _cartItems = [];
  List<CartItemModel> get cartItems => _cartItems;

  void setSelectedProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void addToCart({required ProductModel product, int count = 1}) {
    if (_cartItems.any((element) => element.productModel.id == product.id)) {
      int currentCount = _cartItems.firstWhere((element) => element.productModel.id == product.id).count;
      _cartItems.firstWhere((element) => element.productModel.id == product.id).count = currentCount + count;
    } else {
      _cartItems.add(CartItemModel(productModel: product, count: count));
    }
    notifyListeners();
  }

  void removeFromCart({required ProductModel product, int count = 1}) {
    if (_cartItems.any((element) => element.productModel.id == product.id)) {
      int currentCount = _cartItems.firstWhere((element) => element.productModel.id == product.id).count;
      if (currentCount == 1) {
        _cartItems.removeWhere((element) => element.productModel.id == product.id);
      } else {
        _cartItems.firstWhere((element) => element.productModel.id == product.id).count = currentCount - count;
      }
    }
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getAllProducts() async {
    _isLoading = true;

    Future(() {
      notifyListeners();
    });

    try {
      ResponseModel<dynamic> response = await productService.getAll();
      _products = List<ProductModel>.from(
        response.data.map((product) => ProductModel.fromJson(product)),
      );
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
