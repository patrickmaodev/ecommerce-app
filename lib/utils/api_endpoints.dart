class ApiEndpoints {
  // Base API URL
  static const String baseUrl = "http://192.168.1.16:8080/api/v1";

  // API Urls
  static const String registerUrl = "$baseUrl/auth/customer/register";
  static const String loginUrl = "$baseUrl/auth/customer/login";
  static const String ordersUrl = "$baseUrl/customer/orders";
  static const String productsUrl = "$baseUrl/customer/products";
  static const String categoriesUrl = "$baseUrl/customer/categories";
  static const String categoryProductsUrl = "$baseUrl/customer/categories/{categoryId}/products";
  static const String vendorsUrl = "$baseUrl/customer/vendors";
  static const String productStatusesUrl = "$baseUrl/customer/product-statuses";
}
