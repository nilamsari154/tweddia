import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/baseapiservices.dart';

class UserRegistrationServices {
  static String endpoint = Constanta.baseApiUrl + "/registration/insert.php";

  static Future<ApiResponse> sentRequestInsertDataUser(
      dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
