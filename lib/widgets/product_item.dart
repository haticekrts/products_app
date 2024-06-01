import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/models/product_model.dart';
import 'package:products_app/providers/providers.dart';
import 'package:products_app/views/product/product_detail_view.dart';

class ProductItem extends ConsumerWidget {
  final ProductModel productModel;
  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      pressedOpacity: 0.7,
      padding: EdgeInsets.zero,
      onPressed: () {
        ref.read(productProvider).setSelectedProduct(productModel);
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const ProductDetailView()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: CachedNetworkImage(
                imageUrl: productModel.images.first,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (productModel.brand != null)
                      Text(
                        productModel.brand!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 11,
                        ),
                      ),
                    Text(
                      productModel.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${productModel.price}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
