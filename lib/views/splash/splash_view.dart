import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_app/providers/providers.dart';
import 'package:products_app/services/product_service.dart';
import 'package:products_app/views/home/home_view.dart';
part 'splash_view_mixin.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadProducts(),
        builder: (context, snapshot) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.pink.shade200,
            ),
          );
        },
      ),
    );
  }
}
