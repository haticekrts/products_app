import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/generated/locale_keys.g.dart';
import 'package:products_app/models/cart_item_model.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/providers/providers.dart';

part 'cart_view_mixin.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> with CartViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.cart).tr(),
        scrolledUnderElevation: 0,
      ),
      body: _cartItems.isEmpty
          ? Center(
              child: const Text(LocaleKeys.no_product).tr(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(height: 5, color: Colors.transparent),
                    padding: const EdgeInsets.all(10),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      ProductModel productModel = _cartItems[index].productModel;
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.pink.shade50, borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: productModel.images.first,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (productModel.brand != null)
                                    Text(
                                      productModel.brand!,
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  Text(
                                    productModel.title,
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "\$${productModel.price}",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.pink,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    ref.read(productProvider).removeFromCart(product: productModel);
                                  },
                                ),
                                Text(
                                  ref
                                      .watch(productProvider)
                                      .cartItems
                                      .firstWhere((element) => element.productModel.id == productModel.id)
                                      .count
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                    fontFeatures: [FontFeature.tabularFigures()],
                                  ),
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: const Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    ref.read(productProvider).addToCart(product: productModel);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 50, spreadRadius: 5, color: Colors.pink.shade50),
                      ],
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        LocaleKeys.total_cost,
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ).tr(),
                      Text(
                        '\$${ref.watch(totalCostProvider).toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
