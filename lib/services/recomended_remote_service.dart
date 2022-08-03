import 'package:food_app/models/populer_food_model.dart';
import 'package:http/http.dart' as http;

class RecomendedReammoteServices {
  static var url =
      Uri.parse('http://bhuianfoodapi.herokuapp.com/api/food/recomended');

  static Future fetchToHttp() async {
    var resposeData = await http.get(url);
    if (resposeData.statusCode == 200) {
      var resString = resposeData.body;
      print(resString);
      return populerFoodModelFromJson(resString);
    } else {
      print('Server Err');
    }
  }
}