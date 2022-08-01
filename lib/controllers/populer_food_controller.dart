import 'package:food_app/models/populer_food_model.dart';
import 'package:food_app/services/remote_services.dart';
import 'package:get/get.dart';

class PopulerFoodController extends GetxController {
  var productList = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<List<PopulerFoodModel>?> fetchData() async {
    var product = await ReammoteServices.fetchToHttp();
    if (product != null) {
      productList.value = product;
      print("object");
    }
    return null;
  }
}
