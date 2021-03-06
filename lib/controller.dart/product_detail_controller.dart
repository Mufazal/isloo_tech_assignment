import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_services.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';
import 'package:isloo_tech_assignment/utils/utils.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController get to => Get.find();

  PsResource model;
  bool isConnected;
  bool loading;
  getSingleProductDetail(int id) async {
    model = PsResource(
      status: PsStatus.BLOCK_LOADING,
      message: "",
    );

    Utils.checkInternetConnectivity().then((value) async {
      print(value);
      if (value) {
        ApiServices services = ApiServices();
        model = await services.getSingleProduct(id: id);
        update();
      } else {
        isConnected = false;

        update();
      }
    });
  }
}
