import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/baseapiservices.dart';

class UserLoginServices {
  static String endpoint = Constanta.baseApiUrl + "/login/auth.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
