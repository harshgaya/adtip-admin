import 'package:adtip_admin_panel/dashboard/pages/dashboard_screen.dart';
import 'package:adtip_admin_panel/helpers/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../helpers/constants/url_constants.dart';
import '../../helpers/local_database/local_prefs.dart';
import '../../helpers/local_database/sharedpref_key.dart';
import '../../netwrok/network_api_services.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  Rx<bool> isLoading = false.obs;
  final _apiServices = NetworkApiServices();

  Future<void> adminLogin(
      {required String id, required String password}) async {
    try {
      isLoading.value = true;

      final body = {
        "user_name": id,
        "password": password,
      };
      final response =
          await _apiServices.postApi(body, UrlConstants.ADMIN_LOGIN);
      String? token = response['accessToken'];

      if (token != null) {
        var value = LocalPrefs()
            .setStringPref(key: SharedPreferenceKey.UserLoggedIn, value: token)
            ?.then((value) {
          Get.offAll(const DashBoardScreen());
        }).catchError((e) {});
      }

      if (kDebugMode) {
        print('token after login $token');
        print('response login $response');
      }

      isLoading.value = false;
    } catch (e) {
      Utils.showErrorMessage('Something went wrong');
      if (kDebugMode) {
        print('error login $e');
      }
      isLoading.value = false;
    }
  }
}
