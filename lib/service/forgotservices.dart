import 'package:tweddia/models/constanta.dart';

import 'apiresponse.dart';
import 'baseapiservices.dart';

class UserForgotServices {
  static String endpoint =
      Constanta.baseApiUrl + "/forgotpassword/sendemailverification.php";
  static String endpoint2 = Constanta.baseApiUrl + "/forgotpassword/reset.php";

  static Future<ApiResponse> sendemailverification(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> changePassword(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
