class AppUrl{
  //Todo Stripe urls
  static String stripeBaseUrl = "https://api.stripe.com/v1/payment_intents";
  static String stripeSecretKey = "sk_test_51MOeICHTQCzatOOI7H7L23lbJBG2sFnqjYT5C2sPhciDU8iRadWqhjwwI1vzYIlGEmBIArZTTGT756TWEH3xf4Mo007vUHz5BW";
  static String stripePublishableKey = 'pk_test_51MOeICHTQCzatOOIxjnHyV9uhg6C2EbuVCvIB3tTB4GAbiu0YeMg4dHHth76bMkH1Pu5oEF983WEj2TebkWj7TZ500GdOm3wdZ';
  static String baseUrl = "https://subtracker.dotapp.pk/api/";
  static String login = "auth/login";
  static String register = "auth/register";
  static String forgotPassword = "forgetPassword";
  static String verifyOtp = "verifyOtp";
  static String changePassword = "changePassword";
  static String updatePassword = "changeUserPassword";
  static String subscriptions = "subscriptions";
  static String getSubscriptions = "subscriptions";
  static String getScheduleData = "subscription-schedule/";
  static String activeSubscriptions = "user/active-subscriptions";
  static String termsAndConditions = "settings/terms_and_conditions";
  static String privacyAndPolicy = "settings/privacy_policy";
  static String addCategories = "categories";
  static String storeUserCategories = "user-categories";
  static String getAllCategory = "subscription-categories";
  static String editeCategories = "categories/";//at the end id 2
  static String deleteCategories = "categories/";//at the end id
  static String deleteSubscriptions = "subscriptions/";//at the end id
  static String storeTickets = "tickets";
  static String getTickets = "tickets";
  static String updateTickets = "tickets/";//at the end id
  static String showTicketDetails = "tickets/"; //at the end id
  static String deleteTicket = "tickets/"; //at the end id
  static String geTotalBudgets = "budgets";
  static String getNotifications = "notifications";
  static String updateProfile = "update-profile";
  static String getProfile = "profile";
  static String deleteAccount = "delete-account";
  static String enableTwoFactorAuth = "two-factor-auth/enable";
  static String disableTwoFactorAuth = "two-factor-auth/disable";
  static String getTowTwoFactorQrCode = "two-factor-auth/qr-code";
  static String enableBiometric = "auth/biometric/enable";
  static String disableBiometric = "auth/biometric/disable";
  static String enableEmailNotifications= "auth/email-notifications/enable";
  static String disableEmailNotifications= "auth/email-notifications/disable";
  static String getLanguages = "languages";
  static String updateLanguages = "user/update-language";
  static String getCurrencies = "currencies";
  static String getFaqs = "faqs";
  static String getPlans = "getPlans";
  static String storePlan = "storePlan";
  static String plansCancel = "plans/";
  static String updateCurrencies = "user/update-currency";
  static String updateCategories = "categories/"; //at the end id
  // static String f = "";

}