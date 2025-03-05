class ApiEndpoints {
  // Base API URL
  static const String baseUrl = "http://192.168.43.62:8080/api/v1";

  // API Urls
  static const String registerUrl = "$baseUrl/auth/customer/register";
  static const String loginUrl = "$baseUrl/auth/customer/login";
  static const String ordersUrl = "$baseUrl/orders";
  static const String productsUrl = "$baseUrl/products";
  static const String categoriesUrl = "$baseUrl/categories";
  static const String vendorsUrl = "$baseUrl/vendors";
  static const String productStatusesUrl = "$baseUrl/product-statuses";
}
