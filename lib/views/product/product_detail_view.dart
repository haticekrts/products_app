import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/generated/locale_keys.g.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/providers/providers.dart';
import 'package:products_app/widgets/custom_carousel_slider.dart';

part 'product_detail_view_mixin.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  const ProductDetailView({super.key});

  @override
  ConsumerState<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> with ProductDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.detail).tr(),
        scrolledUnderElevation: 0,
      ),
      body: _selectedProduct != null
          ? Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCarouselSlider(
                          images: _selectedProduct!.images,
                          height: MediaQuery.of(context).size.height / 2,
                          autoPlay: true,
                        ),
                        const SizedBox(height: 10),
                        if (_selectedProduct!.brand != null)
                          Text(
                            _selectedProduct!.brand!,
                            style: TextStyle(
                              color: Colors.pink.shade400,
                              fontSize: 14,
                            ),
                          ),
                        Text(
                          _selectedProduct!.title,
                          style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(5, (index) {
                                if (index < _selectedProduct!.rating.floor()) {
                                  return const Icon(
                                    Icons.star_rounded,
                                    color: Colors.orange,
                                  );
                                } else if (index == _selectedProduct!.rating.floor() &&
                                    _selectedProduct!.rating - _selectedProduct!.rating.floor() > 0) {
                                  return const Icon(
                                    Icons.star_half_rounded,
                                    color: Colors.orange,
                                  );
                                } else {
                                  return const Icon(
                                    Icons.star_border_rounded,
                                    color: Colors.orange,
                                  );
                                }
                              }),
                            ),
                            Text(
                              _selectedProduct!.rating.toString(),
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LocaleKeys.comments,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.pink.shade200,
                          ),
                        ).tr(),
                        const SizedBox(height: 10),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _selectedProduct!.reviews.length,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  _selectedProduct!.reviews[index].reviewerName,
                                  style:
                                      TextStyle(color: Colors.pink.shade300, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                Text(_selectedProduct!.reviews[index].comment),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('dd.MM.yyyy HH:mm').format(_selectedProduct!.reviews[index].date),
                                      style: TextStyle(
                                        color: Colors.pink.shade200,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(color: Colors.pink.shade50);
                          },
                        )
                      ],
                    ),
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
                      Text(
                        "\$${_selectedProduct!.price}",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 30,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          ref.read(productProvider).addToCart(product: _selectedProduct!);
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          : const Center(
              child: Text("null product"),
            ),
    );
  }
}
