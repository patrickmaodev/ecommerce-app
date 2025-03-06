import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';

abstract class CategoryRepositoryInterface {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchCategoryProducts(int categoryId);
}
