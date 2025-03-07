import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/categories/models/sub_category_model.dart';

abstract class CategoryRepositoryInterface {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<SubCategoryModel>> fetchCategoryProducts(int categoryId);
}
