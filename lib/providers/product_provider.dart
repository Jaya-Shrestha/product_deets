import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softbenz_task/model/product_model.dart';
import '../services/api_service.dart';

final productProvider = FutureProvider.family<Product, String>((ref, productId) async {
  final apiService = ApiService();
  return apiService.fetchProductDetails(productId);
});
