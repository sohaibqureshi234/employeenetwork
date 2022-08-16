

class AppConstants {
  // saad_local
  // static const String BASE_URL = 'http://192.168.18.91/yms-backend/public/';
  //zeeshan_local
  // static const String BASE_URL =
  //
  //    'http://192.168.18.36/yms-backend/public/index.php/';
  //zakir local
  // static const String BASE_URL = 'http://192.168.18.26:8000/';
  //staging
  static const String BASE_URL =
      'https://api.wifi-ten.com/';

  // static const String BASE_IMAGE_URL =
  //     'https://oe9lctwjli.execute-api.me-south-1.amazonaws.com/v1/124/';

  static const String BASE_IMG_URL = 'https://fgstg.fayha.com.sa';
  static const String PUT_DATA = 'api/networkSummary?site=c3bf7249-fcb0-433f-bebe-0921e6701658&network=259f060f-2b1e-45bc-833d-51d258dadcf5';
  static const String BASE_PROMOIMG_URL = 'https://cdn.fayha.com.sa/';

  static const String MASTER_DATA = 'api/driver-profile';
  static const String CHECK_ELIGIBILITY = 'api/check-eligibility';
  static const String REFUEL_ELIGIBILITY = 'api/check-transaction-eligibility';
  static const String REQUEST_DATA = 'api/refuel-request';
  static const String UPDATE_LOCATION = 'api/show_pin';
  static const String NEAREST_STATION = 'api/nearest-station';
  static const String SAVE_ESTIMATE = 'api/v1/supplier/save-estimate';
  static const String CREATE_PAYMENT = 'api/v1/supplier/create-payment-request';
  static const String ESTIMATE_LIST = 'api/v1/supplier/show-estimate';
  static const String COMMENTS = 'api/v1/supplier/get-comments/';
  static const String COMPLAINT_ELEMENTS =
      'api/v1/supplier/get-complaint-elements';
  static const String ADD_COMPLAINT = 'api/v1/supplier/add-complaint';
  static const String ADD_COMMENT = 'api/v1/supplier/add-comment';
  static const String ESTIMATE_DETAIL = 'api/v1/supplier/get-estimate/';
  static const String PAYMENT_TICKET = 'api/v1/supplier/open-ticket/1000';
  static const String PAYMENT_REQUESTS =
      'api/v1/supplier/payment-request-list/1000';
  static const String UPDATE_ESTIMATE_STATUS =
      'api/v1/supplier/update-estimate/';
  static const String BENIFITS = 'api/v1/supplier/benefits';
  static const String TICKETS = 'api/v1/supplier/tickets';
  static const String COMPANY_SETTING = 'api/v1/companysetting';
  static const String GETPRODUCTS_BYLOC = 'api/v3/get_products_byloc';
  static const String LOGIN_URI = 'api/driver-login'; // return token and id
  static const String Terms_URI = 'api/driver-terms'; // return token and id
  static const String DRIVER_MANUAL =
      'api/driver-manual'; // return token and id
  static const String REFUEL_HISTORY_URL =
      'api/refueling-history'; // return token and id
  static const String REGISTRATION_URI = 'api/v1/supplier/add/1000';
  static const String SEND_OTP = 'api/v1/supplier/forget-password';
  static const String Verify_OTP = 'api/v1/supplier/verify-otp';
  static const String NEW_PASSWORD = 'api/v1/supplier/change-password';
  static const String UPDATED_PRICES = 'api/v1/supplier/updated-prices';

  // alphanumeric and &%=
  static final VALID_INPUT_EMAIL = RegExp(r'^[a-zA-Z0-9@.]+');
  static final VALID_INPUT = RegExp(r'^[a-zA-Z0-9_ ]+');
  static final VALID_INPUT_NO = RegExp(r'^[0-9]+');

  // // sharePreference
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String CURRENCY = 'currency';

  //Language
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';


}
