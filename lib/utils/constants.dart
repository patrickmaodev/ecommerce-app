class Api {
  // Base API URL
  static const String baseUrl = "http://192.168.1.17:8080/api/v1/";

  // API Endpoints
  static const String registerEndpoint = "$baseUrl/auth/customer/register";
  static const String loginEndpoint = "$baseUrl/auth/customer/login";
  static const String ordersEndpoint = "$baseUrl/orders";
  static const String productsEndpoint = "$baseUrl/products";
  static const String categoriesEndpoint = "$baseUrl/categories";
  static const String vendorsEndpoint = "$baseUrl/vendors";
  static const String productStatusesEndpoint = "$baseUrl/product-statuses";
}
