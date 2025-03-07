import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String categoryName;
  final String subCategoryName;
  final String productStatusName;
  final String imageUrl;
  final int categoryId;
  final int subCategoryId;
  final int productStatusId;
  final List<ProductSpecificationResponse> specifications;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryName,
    required this.subCategoryName,
    required this.productStatusName,
    required this.imageUrl,
    required this.categoryId,
    required this.subCategoryId,
    required this.productStatusId,
    required this.specifications,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var specificationList = (json['specifications'] as List)
        .map((spec) => ProductSpecificationResponse.fromJson(spec))
        .toList();

    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      categoryName: json['categoryName'],
      subCategoryName: json['subCategoryName'],
      productStatusName: json['productStatusName'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      subCategoryId: json['subCategoryId'],
      productStatusId: json['productStatusId'],
      specifications: specificationList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'categoryName': categoryName,
      'subCategoryName': subCategoryName,
      'productStatusName': productStatusName,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'productStatusId': productStatusId,
      'specifications': specifications.map((spec) => spec.toJson()).toList(),
    };
  }

  static ProductModel fromJsonString(String jsonString) {
    return ProductModel.fromJson(json.decode(jsonString));
  }
}

class ProductSpecificationResponse {
  final int id;
  final String name;
  final String value;

  ProductSpecificationResponse({
    required this.id,
    required this.name,
    required this.value,
  });

  factory ProductSpecificationResponse.fromJson(Map<String, dynamic> json) {
    return ProductSpecificationResponse(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }
}
