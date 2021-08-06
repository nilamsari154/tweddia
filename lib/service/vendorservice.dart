import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/baseapiservices.dart';

class VendordataServices {
  static String endpoint = Constanta.baseApiUrl + "/vendor/read.php";

  static Future<ApiResponse> getdatavendor(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
