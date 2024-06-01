part of 'home_view.dart';

mixin HomeViewMixin on ConsumerState<HomeView> {
  List<ProductModel> _products = [];

  @override
  void initState() {
    _products = ref.read(productProvider).products;
    super.initState();
  }
}
