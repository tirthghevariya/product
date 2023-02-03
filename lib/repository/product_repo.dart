import 'package:get/get.dart';
import 'package:product/data/api_data.dart';
import 'package:product/utils/app_constant.dart';

class Productrepo {
  ApiClient apiClient = ApiClient();
  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.newList);
  }
}

class Userrepo {
  UserApiClient apiClient = UserApiClient();
  Future<Response> getUserList() async {
    return await apiClient.usergetData(AppConstant.newsList);
  }
}
