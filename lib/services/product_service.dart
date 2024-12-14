import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

class ProductService {
  // Fetch all products
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(Api.productsEndpoint));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Fetch product by ID
  Future<Product> fetchProductById(String productId) async {
    final response = await http.get(Uri.parse('${Api.productsEndpoint}/$productId'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  // Add a new product
  Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse(Api.productsEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 201) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add product');
    }
  }

  // Update product details
  Future<Product> updateProduct(String productId, Product product) async {
    final response = await http.put(
      Uri.parse('${Api.productsEndpoint}/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }

  // Delete a product
  Future<void> deleteProduct(String productId) async {
    final response = await http.delete(Uri.parse('${Api.productsEndpoint}/$productId'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete product');
    }
  }
}
