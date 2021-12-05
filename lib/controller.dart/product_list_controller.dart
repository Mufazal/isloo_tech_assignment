import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_services.dart';
import 'package:isloo_tech_assignment/utils/utils.dart';

class ProductListController extends GetxController {
  static ProductListController get to => Get.find();
  PsResource model;
  bool isConnected;
  bool loading;
  getMovies() async {
    // notifyListeners();
    loading = false;
    Utils.checkInternetConnectivity().then((value) async {
      print(value);
      if (value) {
        model = await ApiServices.getProductList();
        update();
        // notifyListeners();
      } else {
        isConnected = false;
        update();
        // notifyListeners();
      }
    });
  }
}
