part of 'product_detail_view.dart';

mixin ProductDetailViewMixin on ConsumerState<ProductDetailView> {
  ProductModel? _selectedProduct;

  @override
  void initState() {
    _selectedProduct = ref.read(productProvider).selectedProduct;
    super.initState();
  }
}
