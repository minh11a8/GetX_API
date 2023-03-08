import 'package:get/state_manager.dart';
import 'package:getx_fetchapi/models/product.dart';
import 'package:getx_fetchapi/services/remote_service.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteService.fetchProduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
