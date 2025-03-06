
import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';

abstract class CategoryServiceInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getCategoryProducts(int categoryId);
}
