import 'package:ecommerce_app/features/products/models/product_model.dart';

abstract class ProductRepositoryInterface {
  Future<List<ProductModel>> fetchAllProducts();
}
