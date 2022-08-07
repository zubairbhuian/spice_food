import 'package:food_app/models/populer_food_model.dart';
import 'package:food_app/services/remote_services.dart';
import 'package:get/get.dart';

class PopulerFoodController extends GetxController {
  RxInt quantity = 0.obs;
  var isLoding = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<List<PopulerFoodModel>?> fetchData() async {
    try {
      isLoding(true);
      var product = await ReammoteServices.fetchToHttp();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoding(false);
    }
    return null;
  }

  void setQuantity(bool isIncriment) {
    if (isIncriment) {
      quantity = quantity + 1;
    } else {
      quantity = quantity - 1;
    }
  }
}
