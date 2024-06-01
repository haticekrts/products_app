import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/repositories/product_repository.dart';
import 'package:products_app/services/product_service.dart';

final productProvider = ChangeNotifierProvider((ref) {
  return ProductRepository(productService: ProductService());
});

final totalCostProvider = Provider<double>((ref) {
  final cartItems = ref.watch(productProvider).cartItems;
  double totalCost = 0.0;

  for (var item in cartItems) {
    totalCost += item.productModel.price * item.count;
  }

  return totalCost;
});
