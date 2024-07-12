import 'package:adtip_admin_panel/modules/ad_orders/pages/ad_order_page.dart';
import 'package:adtip_admin_panel/modules/channel/page/channel_page.dart';
import 'package:adtip_admin_panel/modules/channel_withdraw/page/channel_paid_page.dart';
import 'package:adtip_admin_panel/modules/channel_withdraw/page/channel_unpaid_page.dart';
import 'package:adtip_admin_panel/modules/company/page/company_page.dart';
import 'package:adtip_admin_panel/modules/demo_contact/demo_contact_page.dart';
import 'package:adtip_admin_panel/modules/qr_scan_web/pages/qr_scan_all_company.dart';
import 'package:adtip_admin_panel/modules/qr_scan_web/pages/qr_scan_web_unpaid_data.dart';
import 'package:adtip_admin_panel/modules/refer_withdraw/page/referal_paid_page.dart';
import 'package:adtip_admin_panel/modules/refer_withdraw/page/referal_unpaid_page.dart';
import 'package:adtip_admin_panel/paid_funds/pages/paid_fund_screen.dart';
import 'package:adtip_admin_panel/users_list/pages/user_list_page.dart';
import 'package:adtip_admin_panel/withdrawal_requests/pages/withdrawal_request_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  List<Widget> views = const [
    WithDrawalRequest(),
    PaidFundScreen(),
    UserList(),
    CompanyPage(),
    ChannelPage(),
    QrScanAllCompany(),
    DemoContactPage(),
    AdOrderPage(),
    ReferalUnpaidPage(),
    ReferalPaidPage(),
    ChannelUnpaidPage(),
    ChannelPaidPage(),
    //QrScanWebUnpaidData(),
    Center(
      child: Text('Settings'),
    ),
  ];

  void changeIndex({required int index}) {
    selectedIndex.value = index;
  }
}
