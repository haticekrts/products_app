import 'package:products_app/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  int count;

  CartItemModel({required this.productModel, required this.count});
}
