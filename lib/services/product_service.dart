import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:products_app/interfaces/product_interface.dart';
import 'package:products_app/models/response_model.dart';
import 'package:http/http.dart' as http;

class ProductService extends ProductInterface {
  final String baseUrl = dotenv.env["BASE_URL"].toString();

  @override
  Future<ResponseModel> getAll() async {
    Response response = await http.get(Uri.parse("${baseUrl}products"));
    return ResponseModel.fromJson(jsonDecode(response.body));
  }
}
