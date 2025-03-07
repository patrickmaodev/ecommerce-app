import 'package:ecommerce_app/features/products/models/product_model.dart';

class SubCategoryModel {
  final int subCategoryId;
  final String subCategoryName;
  final List<ProductModel> products;

  SubCategoryModel({
    required this.subCategoryId,
    required this.subCategoryName,
    required this.products,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    var productList = (json['products'] as List?)
        ?.map((product) => ProductModel.fromJson(product))
        .toList() ?? [];

    return SubCategoryModel(
      subCategoryId: json['subCategoryId'],
      subCategoryName: json['subCategoryName'],
      products: productList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subCategoryId': subCategoryId,
      'subCategoryName': subCategoryName,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
