import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  // State variables
  List<Product> _products = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Product> get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch all products
  Future<void> fetchProducts() async {
    _setLoading(true);
    _clearError();

    try {
      _products = await _productService.fetchProducts();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load products: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Fetch a single product by ID
  Future<void> fetchProductById(String productId) async {
    _setLoading(true);
    _clearError();

    try {
      _selectedProduct = await _productService.fetchProductById(productId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load product: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Add a new product
  Future<void> addProduct(Product product) async {
    _setLoading(true);
    _clearError();

    try {
      final newProduct = await _productService.addProduct(product);
      _products.add(newProduct);
      notifyListeners();
    } catch (e) {
      _setError('Failed to add product: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Update a product
  Future<void> updateProduct(String productId, Product updatedProduct) async {
    _setLoading(true);
    _clearError();

    try {
      final product = await _productService.updateProduct(productId, updatedProduct);
      final index = _products.indexWhere((p) => p.productId == productId);
      if (index != -1) {
        _products[index] = product;
        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to update product: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Delete a product
  Future<void> deleteProduct(String productId) async {
    _setLoading(true);
    _clearError();

    try {
      await _productService.deleteProduct(productId);
      _products.removeWhere((p) => p.productId == productId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to delete product: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _error = message;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
