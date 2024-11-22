class Product {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final String vendorId;
  final String productStatusId;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.vendorId,
    required this.productStatusId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      categoryId: json['category_id'],
      vendorId: json['vendor_id'],
      productStatusId: json['product_status_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'vendor_id': vendorId,
      'product_status_id': productStatusId,
    };
  }
}
