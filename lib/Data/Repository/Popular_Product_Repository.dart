import 'package:get/get.dart';
import 'package:mart1/Data/Api/Api_client.dart';
import 'package:mart1/Pages/Home/Utils/App_coNstants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}
