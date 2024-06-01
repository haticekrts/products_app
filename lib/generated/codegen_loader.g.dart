// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "welcome": "Hoş Geldiniz",
  "home": "Ana Sayfa",
  "detail": "Detay",
  "cart": "Sepet",
  "no_product": "Ürün yok!",
  "total_cost": "Toplam Tutar:",
  "comments": "Yorumlar",
  "products": "Ürünler"
};
static const Map<String,dynamic> en = {
  "welcome": "Welcome",
  "home": "Home",
  "detail": "Detail",
  "cart": "Cart",
  "no_product": "No product!",
  "total_cost": "Total Cost:",
  "comments": "Comments",
  "products": "Products"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
