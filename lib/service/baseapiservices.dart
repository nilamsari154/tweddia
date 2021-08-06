import 'package:tweddia/service/apiresponse.dart';
import 'package:http/http.dart' as http;

class BaseApiService {
  static Future<ApiResponse> sendPostRequest(
      String url, String authToken, var requestBody) async {
    final response = await http.post(url,
        body: requestBody, headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return apiResponseFromJson(responseString);
    } else {
      return null;
    }
  }
}
