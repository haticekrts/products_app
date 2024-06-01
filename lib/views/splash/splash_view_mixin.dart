part of 'splash_view.dart';

mixin SplashViewMixin on ConsumerState<SplashView> {
  ProductService productService = ProductService();

  Future<void> loadProducts() async {
    await ref.read(productProvider).getAllProducts();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const HomeView()),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
