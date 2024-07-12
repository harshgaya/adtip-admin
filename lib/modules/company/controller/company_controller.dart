import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../helpers/local_database/local_prefs.dart';
import '../../../helpers/local_database/sharedpref_key.dart';
import '../../../netwrok/network_api_services.dart';
import '../models/company_model.dart';

class CompanyController extends GetxController {
  final followCompanyData = <CompanyDetail>[];
  final notFollowCompanyData = <CompanyDetail>[];
  final loadingSecond = false.obs;

  final loading = false.obs;
  final _apiServices = NetworkApiServices();
  int userId =
      LocalPrefs().getIntegerPref(key: SharedPreferenceKey.UserId) ?? 0;
  Future getAllCompany() async {
    try {
      notFollowCompanyData.clear();
      loading.value = true;
      final response =
          await _apiServices.getApi("${UrlConstants.getAllCompany}$userId");
      FollowCompanyModel productListModel =
          FollowCompanyModel.fromJson(response);
      print('response not follow ${response}');
      notFollowCompanyData.addAll(productListModel.data ?? []);
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }
}
