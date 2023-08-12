import 'package:fl_egypt_trust/models/utils/themes/themes_bloc/bloc.dart';

import '../../../di/dependency_injection.dart';

class AppGeneralTrans {
  AppGeneralTrans(_);

  static String getGeneralTransByKey(String key) {
    String appLocal = sl<ThemeBloc>().appLocal;
    try {
      if (appLocal == 'ar-SA') {
        return sl<ThemeBloc>()
            .appGeneralTrans
            .where((element) => element.key == key)
            .first
            .val!;
      } else {
        return sl<ThemeBloc>()
            .appGeneralTrans
            .where((element) => element.key == key)
            .first
            .valEn!;
      }
    } catch (e) {
      return '';
    }
  }

  static String dataRequirementValidationTxt =
      getGeneralTransByKey('dataRequirementValidationTxt');
  static String statesValidationTxt =
      getGeneralTransByKey('statesValidationTxt');
  static String cityValidationTxt = getGeneralTransByKey('cityValidationTxt');
  static String mobileValidationTxt =
      getGeneralTransByKey('mobileValidationTxt');
  static String emailValidationTxt = getGeneralTransByKey('emailValidationTxt');
  static String addressValidationTxt =
      getGeneralTransByKey('addressValidationTxt');
  static String nationalIdValidationTxt =
      getGeneralTransByKey('nationalIdValidationTxt');
  static String docStartDateEmptyValidationTxt =
      getGeneralTransByKey('docStartDateEmptyValidationTxt');
  static String docStartDateFormatValidationTxt =
      getGeneralTransByKey('docStartDateFormatValidationTxt');
  static String docStartDateTimeExceedValidationTxt =
      getGeneralTransByKey('docStartDateTimeExceedValidationTxt');
  static String docEndDateValidationTxt =
      getGeneralTransByKey('docEndDateValidationTxt');
  static String companyNameValidationTxt =
      getGeneralTransByKey('companyNameValidationTxt');
  static String subscriptionPeriodValidationTxt =
      getGeneralTransByKey('subscriptionPeriodValidationTxt');
  static String subscriptionCountValidationTxt =
      getGeneralTransByKey('subscriptionCountValidationTxt');
  static String commissionerNameValidationTxt =
      getGeneralTransByKey('commissionerNameValidationTxt');
  static String commissionerMobileValidationTxt =
      getGeneralTransByKey('commissionerMobileValidationTxt');
  static String commissionerNationalIdValidationTxt =
      getGeneralTransByKey('commissionerNationalIdValidationTxt');
  static String rulesAgreementValidationTxt =
      getGeneralTransByKey('rulesAgreementValidationTxt');
  static String internetExceptionTxt =
      getGeneralTransByKey('internetExceptionTxt');
  static String serverExceptionTxt = getGeneralTransByKey('serverExceptionTxt');
  static String unKnownExceptionTxt =
      getGeneralTransByKey('unKnownExceptionTxt');
  static String nextButtomTxt = getGeneralTransByKey('nextButtomTxt');
  static String perviousButtomTxt = getGeneralTransByKey('perviousButtomTxt');
  static String personNameTxt = getGeneralTransByKey('personNameTxt');
  static String enterTxt = getGeneralTransByKey('enterTxt');
  static String chooseStateFirst = getGeneralTransByKey('chooseStateFirst');
  static String tryAgainTxt = getGeneralTransByKey('tryAgainTxt');
  static String nationalIdTitleTxt = getGeneralTransByKey('nationalIdTitleTxt');
  static String totalTxt = getGeneralTransByKey('totalTxt');
  static String orderStatusTxt = getGeneralTransByKey('orderStatusTxt');
  static String completePaymentTxt = getGeneralTransByKey('completePaymentTxt');
  static String editFilesTxt = getGeneralTransByKey('editFilesTxt');
  static String sendDataTxt = getGeneralTransByKey('sendDataTxt');
  static String myOrdersTxt = getGeneralTransByKey('myOrdersTxt');
  static String buySealTxt = getGeneralTransByKey('buySealTxt');
  static String followOrderTxt = getGeneralTransByKey('followOrderTxt');
  static String refNumTxt = getGeneralTransByKey('refNumTxt');
  static String serviceTypeTxt = getGeneralTransByKey('serviceTypeTxt');
  static String serviceStatusTxt = getGeneralTransByKey('serviceStatusTxt');
  static String sealTxt = getGeneralTransByKey('sealTxt');
  static String signatureTxt = getGeneralTransByKey('signatureTxt');
  static String newTxt = getGeneralTransByKey('newTxt');
  static String reNewTxt = getGeneralTransByKey('reNewTxt');
  static String oredreNumberTxt = getGeneralTransByKey('oredreNumberTxt');
  static String uploadFilesErrorTxt =
      getGeneralTransByKey('uploadFilesErrorTxt');
  static String waitFawryConfirmationTxt =
      getGeneralTransByKey('waitFawryConfirmationTxt');
  static String notPaidYetTxt = getGeneralTransByKey('notPaidYetTxt');
  static String refNumberValidationTxt =
      getGeneralTransByKey('refNumberValidationTxt');
  static String actviateToken = getGeneralTransByKey('actviateToken');
  static String welcomeTxt = getGeneralTransByKey('welcomeTxt');
  static String pinTxt = getGeneralTransByKey('pinTxt');
  static String liecienceTxt = getGeneralTransByKey('liecienceTxt');
  static String secretKeyTxtTxt = getGeneralTransByKey('secretKeyTxtTxt');
  static String editTxt = getGeneralTransByKey('editTxt');
  static String secretKeyTxt = getGeneralTransByKey('secretKeyTxt');
  static String loginTxt = getGeneralTransByKey('loginTxt');
  static String langValidationTxt = getGeneralTransByKey('langValidationTxt');
  static String secretValidationTxt = getGeneralTransByKey('secretValidationTxt');
  static String saveTxt = getGeneralTransByKey('saveTxt');
  static String qrTxt = getGeneralTransByKey('qrTxt');
  static String qrEditiTxt = getGeneralTransByKey('qrEditiTxt');
  static String pinValidationTxt = getGeneralTransByKey('pinValidationTxt');
  static String sdCofigTxt = getGeneralTransByKey('sdCofigTxt');
  static String cancelTxt = getGeneralTransByKey('cancelTxt');
  static String natioanalIdTxt1 = getGeneralTransByKey('natioanalIdTxt1');
  static String issuanceSealTxt = getGeneralTransByKey('issuanceSealTxt');
  static String dataEditedTxt = getGeneralTransByKey('dataEditedTxt');
  static String companyTxt = getGeneralTransByKey('companyTxt');
  static String certStartDateTxt = getGeneralTransByKey('certStartDateTxt');
  static String certEndDateTxt = getGeneralTransByKey('certEndDateTxt');
  static String showSignatureTxt = getGeneralTransByKey('showSignatureTxt');
  static String waitTxt = getGeneralTransByKey('waitTxt');
  static String egyTrustTxt = getGeneralTransByKey('egyTrustTxt');
  static String client = getGeneralTransByKey('client');
  static String natiionalIdTxt = getGeneralTransByKey('natiionalIdTxt');
  static String VategTxt = getGeneralTransByKey('VategTxt');
  static String emailTxt = getGeneralTransByKey('emailTxt');
  static String egyptTrustTxt = getGeneralTransByKey('egyptTrustTxt');
  static String waitSDTxt = getGeneralTransByKey('waitSDTxt');
  static String serialNumTxt = getGeneralTransByKey('serialNumTxt');
  static String clientNameTxt = getGeneralTransByKey('clientNameTxt');
  static String certIssuanceData = getGeneralTransByKey('certIssuanceData');
  static String certIssuanceEndData = getGeneralTransByKey('certIssuanceEndData');
  static String doneEiditedDataTxt = getGeneralTransByKey('doneEiditedDataTxt');
  static String targetDataForSealTxt = getGeneralTransByKey('targetDataForSealTxt');
  static String eneterDataFirstAlertTxt = getGeneralTransByKey('eneterDataFirstAlertTxt');
  static String scanQRcode = getGeneralTransByKey('scanQRcode');
  static String generalNoteTxt = getGeneralTransByKey('generalNoteTxt');
  static String followOrderBackTxt = getGeneralTransByKey('followOrderBackTxt');
  static String generalRulesAgreement = getGeneralTransByKey('generalRulesAgreement');
  static String generalPaymentRulesAgreement = getGeneralTransByKey('generalPaymentRulesAgreement');
  static String branchesEmptyError = getGeneralTransByKey('branchesEmptyError');
  static String activeCertification = getGeneralTransByKey('activeCertification');
  static String activeCertificationsCount = getGeneralTransByKey('activeCertificationsCount');
  static String activeCertificationsPreLoginMessage = getGeneralTransByKey('activeCertificationsPreLoginMessage');
  static String addAnotherDocument = getGeneralTransByKey('addAnotherDocument');
  static String allCities = getGeneralTransByKey('allCities');
  static String bookAppointment = getGeneralTransByKey('bookAppointment');
  static String branches = getGeneralTransByKey('branches');
  static String branchesHint = getGeneralTransByKey('branchesHint');
  static String callus = getGeneralTransByKey('callus');
  static String callusHint = getGeneralTransByKey('callusHint');
  static String cancelReservation = getGeneralTransByKey('cancelReservation');
  static String changeLanguage = getGeneralTransByKey('changeLanguage');
  static String changeLanguageHint = getGeneralTransByKey('changeLanguageHint');
  static String changePasswordHint = getGeneralTransByKey('changePasswordHint');
  static String chat = getGeneralTransByKey('chat');
  static String chatHint = getGeneralTransByKey('chatHint');
  static String confirmPassword = getGeneralTransByKey('confirmPassword');
  static String createAccount = getGeneralTransByKey('createAccount');
  static String createCertification = getGeneralTransByKey('createCertification');
  static String createPassword = getGeneralTransByKey('createPassword');
  static String createPasswordHint = getGeneralTransByKey('createPasswordHint');
  static String documentNameRequired = getGeneralTransByKey('documentNameRequired');
  static String donotGetOtp = getGeneralTransByKey('donotGetOtp');
  // static String branchesEmptyError = getGeneralTransByKey('branchesEmptyError');
  static String enterMobileHint = getGeneralTransByKey('enterMobileHint');
  static String enterOtpHint = getGeneralTransByKey('enterOtpHint');
  static String forgotPassword = getGeneralTransByKey('forgotPassword');
  static String home = getGeneralTransByKey('home');
  static String login = getGeneralTransByKey('login');
  static String logout = getGeneralTransByKey('logout');
  static String mobileNumber = getGeneralTransByKey('mobileNumber');
  static String mobileVerification = getGeneralTransByKey('mobileVerification');
  static String myActiveCertification = getGeneralTransByKey('myActiveCertification');
  static String name = getGeneralTransByKey('name');
  static String nationalId = getGeneralTransByKey('nationalId');
  static String navigation = getGeneralTransByKey('navigation');
  static String next = getGeneralTransByKey('next');
  static String orderInquiry = getGeneralTransByKey('orderInquiry');
  static String orderNumber = getGeneralTransByKey('orderNumber');
  static String ourBranches = getGeneralTransByKey('ourBranches');
  static String password = getGeneralTransByKey('password');
  static String passwordHint = getGeneralTransByKey('passwordHint');
  static String pickupDate = getGeneralTransByKey('pickupDate');
  static String register = getGeneralTransByKey('register');
  static String registration = getGeneralTransByKey('registration');
  static String requestPin = getGeneralTransByKey('requestPin');
  static String resend = getGeneralTransByKey('resend');
  static String reservationInquiry = getGeneralTransByKey('reservationInquiry');
  static String reserve = getGeneralTransByKey('reserve');
  static String revoke = getGeneralTransByKey('revoke');
  static String save = getGeneralTransByKey('save');
  static String saveReservation = getGeneralTransByKey('saveReservation');
  static String search = getGeneralTransByKey('search');
  static String selectBranch = getGeneralTransByKey('selectBranch');
  static String selectCertificationType = getGeneralTransByKey('selectCertificationType');
  static String selectCity = getGeneralTransByKey('selectCity');
  static String selectServiceType = getGeneralTransByKey('selectServiceType');
  static String settings = getGeneralTransByKey('settings');
  static String submit = getGeneralTransByKey('submit');
  static String welcome = getGeneralTransByKey('welcome');
  static String profile = getGeneralTransByKey('profile');
  static String activateTokenPin = getGeneralTransByKey('activateTokenPin');
  static String newInEgyptTrust = getGeneralTransByKey('newInEgyptTrust');
  static String newInEgyptTrustHint = getGeneralTransByKey('newInEgyptTrustHint');
  static String contacts = getGeneralTransByKey('contacts');
  static String whatsAppNotInstalledMessage = getGeneralTransByKey('whatsAppNotInstalledMessage');
  static String selectVisitTime = getGeneralTransByKey('selectVisitTime');
  static String errorChooseCertificateType = getGeneralTransByKey('errorChooseCertificateType');
  static String errorDocumentSize = getGeneralTransByKey('errorDocumentSize');
  static String errorEnterCode = getGeneralTransByKey('errorEnterCode');
  static String errorEnterConfirmPassword = getGeneralTransByKey('errorEnterConfirmPassword');
  static String errorEnterCorrectMobile = getGeneralTransByKey('errorEnterCorrectMobile');
  static String errorEnterCorrectNationalId = getGeneralTransByKey('errorEnterCorrectNationalId');
  static String errorEnterCurrentPassword = getGeneralTransByKey('errorEnterCurrentPassword');
  static String errorEnterDocumentName = getGeneralTransByKey('errorEnterDocumentName');
  static String errorEnterEmail = getGeneralTransByKey('errorEnterEmail');
  static String errorEnterMobile = getGeneralTransByKey('errorEnterMobile');
  static String errorEnterName = getGeneralTransByKey('errorEnterName');
  static String errorEnterNationalId = getGeneralTransByKey('errorEnterNationalId');
  static String errorEnterNewPassword = getGeneralTransByKey('errorEnterNewPassword');
  static String errorEnterPassword = getGeneralTransByKey('errorEnterPassword');
  static String errorMismatchPassword = getGeneralTransByKey('errorMismatchPassword');
  static String errorUploadDocumentImage = getGeneralTransByKey('errorUploadDocumentImage');
  static String errorPickupDate = getGeneralTransByKey('errorPickupDate');
  static String errorSelectCity = getGeneralTransByKey('errorSelectCity');
  static String errorSelectVisitTime = getGeneralTransByKey('errorSelectVisitTime');
  static String errorSelectBranch = getGeneralTransByKey('errorSelectBranch');
  static String appName = getGeneralTransByKey('appName');
  static String camera = getGeneralTransByKey('camera');
  static String cancel = getGeneralTransByKey('cancel');
  static String fileManager = getGeneralTransByKey('fileManager');
  static String ok = getGeneralTransByKey('ok');
  static String pickMapTitle = getGeneralTransByKey('pickMapTitle');
  static String easyLoginMessage = getGeneralTransByKey('easyLoginMessage');
  static String orderInquiryMessage = getGeneralTransByKey('orderInquiryMessage');
  static String reservationInquiryMessage = getGeneralTransByKey('reservationInquiryMessage');
  static String editReservation = getGeneralTransByKey('editReservation');
  static String editCertification = getGeneralTransByKey('editCertification');
  static String changePassword = getGeneralTransByKey('changePassword');
  static String newPassword = getGeneralTransByKey('newPassword');
  static String errorEnterOtp = getGeneralTransByKey('errorEnterOtp');
  static String confirm = getGeneralTransByKey('confirm');
  static String requestPinMessage = getGeneralTransByKey('requestPinMessage');
  static String requestPinTitle = getGeneralTransByKey('requestPinTitle');
  static String revokeMessage = getGeneralTransByKey('revokeMessage');
  static String revokeTitle = getGeneralTransByKey('revokeTitle');
  static String requestingCertificationPin = getGeneralTransByKey('requestingCertificationPin');
  static String revokingCertification = getGeneralTransByKey('revokingCertification');
  static String resetPassword = getGeneralTransByKey('resetPassword');
  static String revokeCertificationOtpMessage = getGeneralTransByKey('revokeCertificationOtpMessage');
  static String noUserCertifications = getGeneralTransByKey('noUserCertifications');
  static String unsavedChangesTitle = getGeneralTransByKey('unsavedChangesTitle');
  static String unsavedChangesMessage = getGeneralTransByKey('unsavedChangesMessage');
  static String logoutMessage = getGeneralTransByKey('logoutMessage');
  static String gallery = getGeneralTransByKey('gallery');
  static String discard = getGeneralTransByKey('discard');
  static String view = getGeneralTransByKey('view');
  static String permissionsDeniedMessage = getGeneralTransByKey('permissionsDeniedMessage');
  static String permissionsDeniedTitle = getGeneralTransByKey('permissionsDeniedTitle');
  static String back = getGeneralTransByKey('back');
  static String revokeCertification = getGeneralTransByKey('revokeCertification');
  static String appUpdate = getGeneralTransByKey('appUpdate');
  static String update = getGeneralTransByKey('update');
  static String errorSelectService = getGeneralTransByKey('errorSelectService');
  static String pickTypeTitle = getGeneralTransByKey('pickTypeTitle');




}
