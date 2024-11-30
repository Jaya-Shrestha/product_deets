import 'package:dio/dio.dart';
import 'package:softbenz_task/model/product_model.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: 'https://oriflamenepal.com/api/product/for-public',
            ));

  Future<Product> fetchProductDetails(String productId) async {
    try {
      final response = await _dio.get('/smart-sync-lipstick-$productId');

      if (response.statusCode == 200 && response.data != null) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Unexpected API response');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Connection error: ${e.message}');
      }
    }
  }
}
