import 'package:flutter/cupertino.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_services.dart';
import 'package:isloo_tech_assignment/utils/utils.dart';

class ProductListController extends ChangeNotifier {
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
        notifyListeners();
      } else {
        isConnected = false;
        notifyListeners();
      }
    });
  }
}
