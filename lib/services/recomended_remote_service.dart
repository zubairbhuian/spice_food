import 'package:food_app/models/populer_food_model.dart';
import 'package:food_app/utils/app_constants.dart';

import 'package:http/http.dart' as http;

class RecomendedReammoteServices {
  static var url = Uri.parse(AppConstants.baseURL+AppConstants.recommendedProductURL);

  static Future fetchToHttp() async {
    var resposeData = await http.get(url);
    if (resposeData.statusCode == 200) {
      var resString = resposeData.body;
      return populerFoodModelFromJson(resString);
    } else {
    }
  }
}
