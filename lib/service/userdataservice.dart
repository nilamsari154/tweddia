import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/service/apiresponse.dart';

import 'baseapiservices.dart';

class UserdataServices {
  static String endpoint = Constanta.baseApiUrl + "/user/read.php";
  static String endpoint2 = Constanta.baseApiUrl + "/user/update.php";
  static String endpoint3 = Constanta.baseApiUrl + "/help/insert.php";
  static String endpoint4 = Constanta.baseApiUrl + "/favorit/insert.php";
  static String endpoint5 = Constanta.baseApiUrl + "/favorit/read.php";

  static Future<ApiResponse> getdatauser(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> updatedatauser(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> inserthelp(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint3, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> insertfavorit(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint4, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> readfavorit(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint5, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
