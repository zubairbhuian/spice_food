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

  void incriment() {
    quantity = checkQuantity(quantity + 1);
  }

  void decriment() {
    quantity = checkQuantity(quantity - 1);
  }

  RxInt checkQuantity(RxInt quantity) {
    if (quantity < 0) {
      return 0.obs;
    } else if (quantity > 20) {
      return 20.obs;
    } else {
      return quantity;
    }
  }
}
