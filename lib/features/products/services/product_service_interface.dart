import 'package:ecommerce_app/features/products/models/product_model.dart';

abstract class ProductServiceInterface {
  Future<List<ProductModel>> getProducts();
}
