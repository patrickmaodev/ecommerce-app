import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/categories/models/sub_category_model.dart';
import 'package:ecommerce_app/features/categories/repositories/category_repository.dart';
import 'package:ecommerce_app/features/categories/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryService _categoryService;

  var categories = <CategoryModel>[].obs;
  var categoryProducts = <SubCategoryModel>[].obs;
  var isLoading = false.obs;

  CategoryController(ApiClient apiClient)
      : _categoryService = CategoryService(CategoryRepository(apiClient));

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;

    try {
      var fetchedCategories = await _categoryService.getCategories();
      categories.assignAll(fetchedCategories);
    } catch (e, stackTrace) {
      debugPrint("Error fetching products: $e\n$stackTrace");
      categories.clear();
    } finally {
      isLoading.value = false;

    }
  }

  Future<void> fetchCategoryProducts(int categoryId) async {
    isLoading.value = true;

    try {
      var fetchedCategoryProducts = await _categoryService.getCategoryProducts(categoryId);
      categoryProducts.assignAll(fetchedCategoryProducts);
    } catch (e) {
      categoryProducts.clear();
    } finally {
      isLoading.value = false;

    }
  }
}
