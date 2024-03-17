import 'package:adtip_admin_panel/paid_funds/models/paid_fund_model.dart';
import 'package:get/get.dart';

import '../../helpers/constants/url_constants.dart';
import '../../helpers/utils/utils.dart';
import '../../netwrok/network_api_services.dart';

class PaidFundController extends GetxController {
  RxList<PaidFund> paidFundsList = <PaidFund>[].obs;
  RxBool isLoading = false.obs;
  final _apiServices = NetworkApiServices();

  Future<void> getPaidFunds() async {
    try {
      isLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.GET_PAID_FUNDS}');
      final PaidFundModel paidFundModel = PaidFundModel.fromJson(response);
      if (paidFundModel.data.isNotEmpty) {
        paidFundsList.addAll(paidFundModel.data);
        print('withdraw request length ${paidFundsList.length}');
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Utils.showErrorMessage('Something went wrong.$e');
    }
  }
}
