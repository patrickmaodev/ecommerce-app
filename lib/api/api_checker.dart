import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ApiChecker {
  /// Check if the device has an active internet connection
  static Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    
    // If there's no connection at all, return false
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    // Perform an actual internet check by pinging Google
    return await _testInternetAccess();
  }

  /// Check if a specific server is available by making an HTTP request
  static Future<bool> isServerAvailable(String serverUrl) async {
    try {
      final response = await http.get(Uri.parse(serverUrl)).timeout(Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Helper method to test internet access
  static Future<bool> _testInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
