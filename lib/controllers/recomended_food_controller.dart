import 'package:food_app/models/populer_food_model.dart';
import 'package:food_app/services/recomended_remote_service.dart';
import 'package:get/get.dart';

class RecomendedFoodController extends GetxController {
  var isLoding = true.obs;
  var productList = [].obs;

  // get isEmpty => null;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<List<PopulerFoodModel>?> fetchData() async {
    try {
      isLoding(true);
      var product = await RecomendedReammoteServices.fetchToHttp();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoding(false);
    }
    return null;
  }
}
