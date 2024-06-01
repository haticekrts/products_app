import 'package:products_app/models/response_model.dart';

abstract class ProductInterface {
  Future<ResponseModel> getAll();
}
