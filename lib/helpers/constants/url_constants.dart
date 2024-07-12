class UrlConstants {
  static String kUriPrefix = 'https://adtip.page.link';
//stagging
  static const BASE_URL = "https://adtip2.qa.ad-tip.com/api/admin/";
  static const BASE_URL_2 = "https://adtip2.qa.ad-tip.com/api/";
//production
  // static const BASE_URL = "http://adtip2.prod.ad-tip.com/api/";

  ///admin login
  static const ADMIN_LOGIN = "${BASE_URL}authenticate";

  ///wallet
  static const GET_WITHDRAW_REQUESTS = "${BASE_URL}getwithdrawRequest/";
  static const CHECK_BALANCE = "${BASE_URL}withdrawFundFromWallet/";
  static const CHANGE_STATUS_PAID = "${BASE_URL}changeStatusPaid";
  static const GET_PAID_FUNDS = "${BASE_URL}getPaidFunds";

  /// users
  static const getUsers = "${BASE_URL}getallusers/";

  static const getAllCompany = "${BASE_URL_2}getallcompanylist/";
  static const getAllChannels = "${BASE_URL}getallchannels/";

  ///qr web data
  static const getAllQrWebUniqueCompanyId =
      "${BASE_URL}getAllQrWebUniqueCompanyId";
  static const getQrUnpaidDataByCompanyId =
      "${BASE_URL}getQrUnpaidDataByCompanyId/";
  static const getQrPaidDataByCompanyId =
      "${BASE_URL}getQrPaidDataByCompanyId/";
  static const changeQrWebUnpaidToPaid = "${BASE_URL}changeQrWebUnpaidToPaid";

  ///demo contact
  static const getDemoContact = "${BASE_URL}getDemoList/";

  ///ad orders
  static const getAdOrders = "${BASE_URL}getAdOrders/";

  ///refer
  static const getReferalUnpaid = "${BASE_URL}getReferalUnpaid/";
  static const getReferalPaid = "${BASE_URL}getReferalPaid/";
  static const changeUnpaidToPaidReferal =
      "${BASE_URL}changeUnpaidToPaidReferal/";

  ///channel withdraw
  static const getChannelUnpaid = "${BASE_URL}getChannelUnpaid/";
  static const getChannelPaid = "${BASE_URL}getChannelPaid/";
  static const changeUnpaidToPaidChannel =
      "${BASE_URL}changeUnpaidToPaidChannel/";
}
