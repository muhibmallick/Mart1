import 'package:get/get.dart';
import 'package:mart1/Data/Api/Api_client.dart';
import 'package:mart1/Pages/Home/Utils/App_coNstants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}
