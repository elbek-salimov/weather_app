import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/constants/app_constants.dart';
import '../models/detail/one_call_data.dart';
import '../models/my_response.dart';
import '../models/simple/weather_main_model.dart';

class ApiProvider {
  static Future<MyResponse> getSimpleWeatherInfo(String city) async {
    Map<String, String> queryParams = {
      "appid": AppConstants.apiKey,
      "q": city,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/weather",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> getComplexWeatherInfo() async {
    Map<String, String> queryParams = {
      "lat": "41.2646",
      "lon": "69.2163",
      "exclude": "minutely,current",
      "appid": AppConstants.complexApiKey,
      "units": "metric",
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/3.0/onecall",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: OneCallData.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}
