import 'package:projectx/utils/base_uri.dart';

class Endpoints {
  static const String passwordless = "{$baseUri}/auth/passwordless";
  static const String ssoGoogle = "{$baseUri}/auth/sso/redirect";
  static const String verifyOTP = "{$baseUri}/auth/verifyotp";
}
