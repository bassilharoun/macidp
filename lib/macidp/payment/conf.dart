import 'dart:io';

class InAppPaymentSetting {
  // shopperResultUrl : this name must like scheme in intent-filter , url scheme in xcode
  static const String shopperResultUrl= "com.testpayment.payment";
  static const String merchantId= "MerchantId";
  static const String countryCode="SA";
  static getLang() {
    if (Platform.isIOS) {
      return  "en"; // ar
    } else {
      return "en_US"; // ar_AR
    }
  }
}