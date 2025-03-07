
import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/categories/models/sub_category_model.dart';

abstract class CategoryServiceInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<SubCategoryModel>> getCategoryProducts(int categoryId);
}
