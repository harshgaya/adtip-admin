import 'package:adtip_admin_panel/paid_funds/pages/paid_fund_screen.dart';
import 'package:adtip_admin_panel/withdrawal_requests/pages/withdrawal_request_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  List<Widget> views = const [
    WithDrawalRequest(),
    PaidFundScreen(),
    Center(
      child: Text('Settings'),
    ),
  ];

  void changeIndex({required int index}) {
    selectedIndex.value = index;
  }
}
