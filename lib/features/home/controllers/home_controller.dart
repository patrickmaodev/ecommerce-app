import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/features/categories/controllers/category_controller.dart';
import 'package:ecommerce_app/features/products/controllers/product_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  final CategoryController categoryController = Get.put(CategoryController(ApiClient()));
  final ProductController productController = Get.put(ProductController(ApiClient()));

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading.value = true;

      await Future.wait([
        categoryController.fetchCategories(),
        productController.fetchProducts(),
      ]);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}

