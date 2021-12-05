import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_services.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';
import 'package:isloo_tech_assignment/utils/utils.dart';

class ProductListController extends GetxController {
  static ProductListController get to => Get.find();
  PsResource model;
  bool isConnected = false;
  bool loading = false;
  getMovies() async {
    print(
        'Enter to get movies method ---------------------------------------------------');
    model = PsResource(
      status: PsStatus.BLOCK_LOADING,
      message: "",
    );
    // update();
    // notifyListeners();

    bool value = await Utils.checkInternetConnectivity();
    print(" Connection Status ----------------------- $value");
    if (value) {
      ApiServices services = ApiServices();
      model = await services.getProductList();
      update();
      // notifyListeners();
    } else {
      isConnected = false;
      update();
      // notifyListeners()an;
    }
  }
}
