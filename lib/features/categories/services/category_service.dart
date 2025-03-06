import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/categories/repositories/category_repository.dart';
import 'package:ecommerce_app/features/categories/services/category_service_interface.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';

class CategoryService implements CategoryServiceInterface {
  final CategoryRepository categoryRepository;

  CategoryService(this.categoryRepository);

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await categoryRepository.fetchCategories();
  }

  @override
  Future<List<ProductModel>> getCategoryProducts(int categoryId) async {
    return await categoryRepository.fetchCategoryProducts(categoryId);
  }

}
