import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../helpers/utils/utils.dart';
import '../../../netwrok/network_api_services.dart';
import '../models/refer_withdraw_model.dart';

class ReferController extends GetxController {
  RxBool unpaidLoading = false.obs;
  RxBool paidLoading = false.obs;
  final _apiServices = NetworkApiServices();
  int pageUnpaid = -1;
  int pagePaid = -1;
  RxList<ReferWithdraw> referWithdrawUnpaid = <ReferWithdraw>[].obs;
  RxList<ReferWithdraw> referWithdrawPaid = <ReferWithdraw>[].obs;
  Future<void> getWithdrawalRequestUnpaid() async {
    try {
      pageUnpaid++;
      unpaidLoading.value = true;
      final response = await _apiServices
          .getApi('${UrlConstants.getReferalUnpaid}$pageUnpaid');
      final ReferWithdrawModel withDrawRequestModel =
          ReferWithdrawModel.fromJson(response);
      referWithdrawUnpaid.addAll(withDrawRequestModel.data ?? []);

      unpaidLoading.value = false;
    } catch (e) {
      unpaidLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<void> getWithdrawalRequestPaid() async {
    try {
      pagePaid++;
      paidLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getReferalPaid}$pagePaid');
      final ReferWithdrawModel withDrawRequestModel =
          ReferWithdrawModel.fromJson(response);
      referWithdrawPaid.addAll(withDrawRequestModel.data ?? []);

      paidLoading.value = false;
    } catch (e) {
      paidLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<void> changeUnpaidToPaidReferal({required int id}) async {
    try {
      final response = await _apiServices
          .getApi('${UrlConstants.changeUnpaidToPaidReferal}$id');
      Utils.showSuccessMessage('Paid successfully!');
    } catch (e) {
      Utils.showErrorMessage('Something went wrong.');
    }
  }
}
