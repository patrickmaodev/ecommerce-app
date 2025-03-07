import 'package:flutter/foundation.dart';
import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';
import 'package:ecommerce_app/features/products/repositories/product_repository_interface.dart';
import 'package:ecommerce_app/utils/api_endpoints.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ApiClient apiClient;

  ProductRepository(this.apiClient);

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await apiClient.getData(ApiEndpoints.productsUrl);

      if (response is List) {
        return response
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final data = response['data'];

        if (data is List) {
          return data
              .map(
                  (json) => ProductModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }

      throw Exception("Unexpected API response format");
    } catch (e, stackTrace) {
      debugPrint("Error fetching products: $e\n$stackTrace");
      return [];
    }
  }
}
