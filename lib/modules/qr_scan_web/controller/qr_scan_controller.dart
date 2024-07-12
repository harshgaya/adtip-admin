import 'package:adtip_admin_panel/modules/qr_scan_web/models/qr_scan_company_model.dart';
import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../helpers/utils/utils.dart';
import '../../../netwrok/network_api_services.dart';
import '../models/qr_scan_paid_model.dart';
import '../models/qr_scan_unpaid_model.dart';

class QrScanController extends GetxController {
  Rx<bool> isLoading = false.obs;
  final _apiServices = NetworkApiServices();
  RxList<QrScanCompanyModel> qrCompany = <QrScanCompanyModel>[].obs;
  RxList<QrScanUnpaidModel> qrScanUnpaid = <QrScanUnpaidModel>[].obs;
  RxList<QrScanPaidModel> qrScanPaid = <QrScanPaidModel>[].obs;
  Rx<bool> loadingUnpaid = false.obs;
  Rx<bool> loadingPaid = false.obs;
  int page = -1;
  int paidPage = -1;
  Rx<int> selectedCompanyId = 0.obs;

  Future<void> getQrUniqueCompany() async {
    try {
      isLoading.value = true;
      final response =
          await _apiServices.getApi(UrlConstants.getAllQrWebUniqueCompanyId);
      final QrScanCompany qrScanCompany = QrScanCompany.fromJson(response);
      if (qrScanCompany.data.isNotEmpty) {
        qrCompany.addAll(qrScanCompany.data);
        print('data length ${qrCompany.length}');
      }
      isLoading.value = false;
    } catch (e) {
      print('error $e');
      isLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getQrUnpaidData({required int companyId}) async {
    try {
      page++;
      loadingUnpaid.value = true;
      final response = await _apiServices.getApi(
          '${UrlConstants.getQrUnpaidDataByCompanyId}$page/20/$companyId');
      final QrScanUnpaid qrScan = QrScanUnpaid.fromJson(response);
      if (qrScan.data.isNotEmpty) {
        qrScanUnpaid.addAll(qrScan.data);
        print('data length unpaid qr scan ${qrScanUnpaid.length}');
      }
      loadingUnpaid.value = false;
    } catch (e) {
      print('error $e');
      loadingUnpaid.value = false;
      Utils.showErrorMessage('Something went wrong.');
    } finally {
      loadingUnpaid.value = false;
    }
  }

  Future<void> getQrPaidData({required int companyId}) async {
    try {
      paidPage++;
      loadingPaid.value = true;
      final response = await _apiServices.getApi(
          '${UrlConstants.getQrPaidDataByCompanyId}$paidPage/20/$companyId');
      final QrScanPaid qrScan = QrScanPaid.fromJson(response);
      if (qrScan.data.isNotEmpty) {
        qrScanPaid.addAll(qrScan.data);
        print('data length unpaid qr scan ${qrScanPaid.length}');
      }
      loadingPaid.value = false;
    } catch (e) {
      print('error $e');
      loadingPaid.value = false;
      Utils.showErrorMessage('Something went wrong.');
    } finally {
      loadingPaid.value = false;
    }
  }

  Future<void> setUnpaidToPaid({required int id}) async {
    try {
      final response = await _apiServices
          .getApi('${UrlConstants.changeQrWebUnpaidToPaid}/$id');
      Utils.showSuccessMessage('Successfully paid!');
    } catch (e) {
      Utils.showErrorMessage('Error');
    } finally {}
  }
}
