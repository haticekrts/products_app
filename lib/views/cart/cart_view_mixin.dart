part of 'cart_view.dart';

mixin CartViewMixin on ConsumerState<CartView> {
  List<CartItemModel> _cartItems = [];

  @override
  void initState() {
    _cartItems = ref.read(productProvider).cartItems;
    super.initState();
  }
}
