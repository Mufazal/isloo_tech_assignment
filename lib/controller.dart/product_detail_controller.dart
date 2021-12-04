import 'package:flutter/cupertino.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_services.dart';
import 'package:isloo_tech_assignment/utils/utils.dart';

class ProductDetailController extends ChangeNotifier {
  PsResource model;
  bool isConnected;
  bool loading;
  getMovies(int id) async {
    // notifyListeners();
    loading = false;
    Utils.checkInternetConnectivity().then((value) async {
      print(value);
      if (value) {
        model = await ApiServices.getSingleProduct(id: id);
        notifyListeners();
      } else {
        isConnected = false;
        notifyListeners();
      }
    });
  }
}
