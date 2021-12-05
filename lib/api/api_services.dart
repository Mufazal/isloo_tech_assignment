import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isloo_tech_assignment/api/api.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_response.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';

class ApiServices {
  ApiServices();

  getProductList() async {
    try {
      // Dio dio = Dio();
      Uri uri = Uri.parse("${Api.GET_ALL_PRODUCTS}");
      var response = await http
          .get(
        uri,
      )
          .catchError((e) {
        print("Error get Data");
        return PsResource(
            status: PsStatus.ERROR, message: "Connection Error", data: null);
      });

      print(response.statusCode);

      print(response.body.toString());
      ApiResponse apiResponse = ApiResponse(response);

      if (apiResponse.isSuccessful()) {
        return PsResource(
            list: json.decode(response.body),
            message: "",
            status: PsStatus.SUCCESS);
      } else {
        return PsResource(
            status: PsStatus.ERROR,
            message: apiResponse.errorMessage,
            data: null);
      }
    } catch (e) {
      print(e.toString());
      return PsResource(
          status: PsStatus.ERROR, message: e.errorMessage, data: null);
      //e.message ??
    }
  }

  getSingleProduct({int id}) async {
    try {
      print("Product ID---------------------$id");
      Uri uri = Uri.parse("${Api.Get_SINGLE_PRODUCT}$id");
      var response = await http
          .get(
        uri,
      )
          .catchError((e) {
        print("Error get Data");
        return PsResource(
            status: PsStatus.ERROR, message: "Connection Error", data: null);
      });

      print(response.statusCode);

      print(response.body.toString());
      ApiResponse apiResponse = ApiResponse(response);

      if (apiResponse.isSuccessful()) {
        return PsResource(
            data: json.decode(response.body),
            message: "",
            status: PsStatus.SUCCESS);
      } else {
        return PsResource(
            status: PsStatus.ERROR,
            message: apiResponse.errorMessage,
            data: null);
      }
    } catch (e) {
      print(e.toString());
      return PsResource(
          status: PsStatus.ERROR, message: e.errorMessage, data: null);
      //e.message ??
    }
  }
}
