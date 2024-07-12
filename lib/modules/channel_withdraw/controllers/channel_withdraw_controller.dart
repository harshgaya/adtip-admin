import 'package:adtip_admin_panel/modules/channel_withdraw/models/channel_withdraw_model.dart';
import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../helpers/utils/utils.dart';
import '../../../netwrok/network_api_services.dart';

class ChannelWithdrawController extends GetxController {
  RxBool unpaidLoading = false.obs;
  RxBool paidLoading = false.obs;
  final _apiServices = NetworkApiServices();
  int pageUnpaid = -1;
  int pagePaid = -1;
  RxList<ChannelWithdraw> channelWithdrawUnpaid = <ChannelWithdraw>[].obs;
  RxList<ChannelWithdraw> channelWithdrawPaid = <ChannelWithdraw>[].obs;
  Future<void> getChannelWithdrawalRequestUnpaid() async {
    try {
      pageUnpaid++;
      unpaidLoading.value = true;
      final response = await _apiServices
          .getApi('${UrlConstants.getChannelUnpaid}$pageUnpaid');
      final ChannelWithdrawModel withDrawRequestModel =
          ChannelWithdrawModel.fromJson(response);
      channelWithdrawUnpaid.addAll(withDrawRequestModel.data ?? []);

      unpaidLoading.value = false;
    } catch (e) {
      unpaidLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<void> getChannelWithdrawalRequestPaid() async {
    try {
      pagePaid++;
      paidLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getChannelPaid}$pagePaid');
      final ChannelWithdrawModel withDrawRequestModel =
          ChannelWithdrawModel.fromJson(response);
      channelWithdrawPaid.addAll(withDrawRequestModel.data ?? []);

      paidLoading.value = false;
    } catch (e) {
      paidLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<void> changeUnpaidToPaidChannel({required int id}) async {
    try {
      final response = await _apiServices
          .getApi('${UrlConstants.changeUnpaidToPaidChannel}$id');
      Utils.showSuccessMessage('Paid successfully!');
    } catch (e) {
      Utils.showErrorMessage('Something went wrong.');
    }
  }
}
