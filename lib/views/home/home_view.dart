import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/generated/locale_keys.g.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/providers/providers.dart';
import 'package:products_app/views/cart/cart_view.dart';
import 'package:products_app/widgets/product_item.dart';
part 'home_view_mixin.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.home).tr(),
        scrolledUnderElevation: 0,
        actions: [
          CupertinoButton(
            child: const Icon(Icons.shopping_cart_rounded),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const CartView()),
              );
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProductItem(productModel: _products[index]);
        },
      ),
    );
  }
}
