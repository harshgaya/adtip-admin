import 'dart:convert';

import 'package:adtip_admin_panel/helpers/constants/url_constants.dart';
import 'package:adtip_admin_panel/helpers/utils/utils.dart';
import 'package:adtip_admin_panel/netwrok/network_api_services.dart';
import 'package:adtip_admin_panel/withdrawal_requests/models/withdraw_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WithdrawalRequestController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> pageLoading = false.obs;
  final _apiServices = NetworkApiServices();
  int page = -1;
  RxList<WithdrawRequest> withdrawRequestList = <WithdrawRequest>[].obs;

  Future<void> getWithdrawalRequest() async {
    try {
      page++;
      pageLoading.value = true;
      final response = await _apiServices
          .getApi('${UrlConstants.GET_WITHDRAW_REQUESTS}$page/20');
      final WithDrawRequestModel withDrawRequestModel =
          WithDrawRequestModel.fromJson(response);
      if (withDrawRequestModel.data.isNotEmpty) {
        withdrawRequestList.addAll(withDrawRequestModel.data);
        print('withdraw request length ${withdrawRequestList.length}');
      }
      pageLoading.value = false;
    } catch (e) {
      pageLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<void> checkBalance(
      {required int userId, required BuildContext context}) async {
    try {
      var body = {
        'check_bal_flag': 'CHECK_BAL',
        'withdraw_req_amount': 0,
        'userId': userId
      };
      final response =
          await _apiServices.postApi(body, UrlConstants.CHECK_BALANCE);
      print('response check balance $response');
      Utils.showAlertDialog(
          context: context,
          title: 'User Balance',
          subtitle: response['message']);
    } catch (e) {
      Utils.showErrorMessage('Something went wrong.');
    }
  }

  Future<double?> returnBalance({required int userId}) async {
    try {
      var body = {
        'check_bal_flag': 'CHECK_BAL',
        'withdraw_req_amount': 0,
        'userId': userId
      };
      final response =
          await _apiServices.postApi(body, UrlConstants.CHECK_BALANCE);
      var balance = response['data']['data'][0]['totalbalance'];
      return balance;
    } catch (e) {
      return null;
    }
  }

  Future<void> updatePaidToUnpaid(
      {required int userId,
      required BuildContext context,
      required double totalBalance,
      required var withdrawReqAmount,
      required String transactionType,
      required String transactionMethod,
      required String? bankName,
      required String? accountNumber,
      required String? ifsc,
      required String? mobileNumber,
      required String? upiId,
      required int requestId,
      required int id,
      required}) async {
    try {
      var body = {
        "totalBalance": totalBalance,
        "amount": 0,
        "withdraw_req_amount": withdrawReqAmount,
        "transaction_type": transactionType,
        "transaction_method": transactionMethod,
        "paid_status": "Paid",
        "bankName": bankName,
        "accountNumber": accountNumber,
        "IFSC": ifsc,
        "mobileNumber": mobileNumber,
        "UPI_ID": upiId,
        "userId": userId,
        "request_id": requestId,
        "id": id
      };
      await _apiServices.postApi(body, UrlConstants.CHANGE_STATUS_PAID);

      Utils.showSuccessMessage("Paid successfully.");
    } catch (e) {
      Utils.showErrorMessage('Something went wrong. $e');
    }
  }
}
