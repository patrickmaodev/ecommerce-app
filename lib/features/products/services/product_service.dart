import 'package:ecommerce_app/features/products/models/product_model.dart';
import 'package:ecommerce_app/features/products/repositories/product_repository.dart';
import 'package:ecommerce_app/features/products/services/product_service_interface.dart';

class ProductService implements ProductServiceInterface {
  final ProductRepository productRepository;

  ProductService(this.productRepository);

  @override
  Future<List<ProductModel>> getProducts() async {
    return await productRepository.fetchAllProducts();
  }
}
