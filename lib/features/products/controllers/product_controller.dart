import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/features/products/repositories/product_repository.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/products/models/product_model.dart';
import 'package:ecommerce_app/features/products/services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService;

  final RxList<ProductModel> _products = <ProductModel>[].obs;
  final RxBool _isLoading = false.obs;

  ProductController(ApiClient apiClient) : _productService = ProductService(ProductRepository(apiClient));

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    _isLoading.value = true;

    try {
      var fetchedProducts = await _productService.getProducts();
      _products.assignAll(fetchedProducts);
    } catch (e) {
      _products.clear();
    } finally {
      _isLoading.value = false;
    }
  }
}
