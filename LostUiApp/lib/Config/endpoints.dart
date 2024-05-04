class Endpoints {
  static const String endpointPrefix = "https://lostcal.onrender.com";
  static String signInEndpoint = "$endpointPrefix/api/user/login";
  static String signUpEndpoint = "$endpointPrefix/api/user/signup";
  static String getYourFound = "$endpointPrefix/api/lost";
  static String getMyLost = "$endpointPrefix/api/mylost";
  static String updateUsernameEndpoint = "$endpointPrefix/api/user/changename/";
  static String updatePasswordEndpoint =
      "$endpointPrefix/api/user/updateMyPassword/";
  static String searchLostEndpoint = "$endpointPrefix/api/mylost/search";
}
