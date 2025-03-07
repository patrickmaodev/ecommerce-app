import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/features/categories/models/category_model.dart';
import 'package:ecommerce_app/features/categories/models/sub_category_model.dart';
import 'package:ecommerce_app/features/categories/repositories/category_repository_interface.dart';
import 'package:ecommerce_app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final ApiClient apiClient;

  CategoryRepository(this.apiClient);

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await apiClient.getData(ApiEndpoints.categoriesUrl);

      if (response is List) {
        return response
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      } else if (response is Map<String, dynamic> && response['data'] is List) {
        List<dynamic> data = response['data'];
        return data
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<SubCategoryModel>> fetchCategoryProducts(int categoryId) async {
    try {
      final url = ApiEndpoints.categoryProductsUrl
          .replaceFirst("{categoryId}", categoryId.toString());
      final response = await apiClient.getData(url);

      print(response);

      if (response is Map<String, dynamic> && response['result'] is List) {
        List<dynamic> data = response['result'];

        return data.map((product) => SubCategoryModel.fromJson(product)).toList();
      } else {
        return [];
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching products: $e\n$stackTrace");
      return [];
    }
  }
}
