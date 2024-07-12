import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../netwrok/network_api_services.dart';
import '../models/ad_order_model.dart';

class AdOrderController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<AdOrderModel> list = <AdOrderModel>[].obs;
  int page = -1;
  final _apiServices = NetworkApiServices();

  Future<void> getAdOrders() async {
    try {
      page++;
      isLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getAdOrders}$page/20');
      final AdOrder adOrder = AdOrder.fromJson(response);
      list.addAll(adOrder.data);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
