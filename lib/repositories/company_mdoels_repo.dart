import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import '../models/comapny_models.dart/company_models.dart';
import '../services/networking/api_client.dart';
import '../services/networking/print_response_info.dart';

class CompanyModelsRepository {
  // final ApiService _apiService;
  final ApiClient apiClient;

  CompanyModelsRepository(this.apiClient);

  var response = {
    "status": "1",
    "data": [
      {"id": 1, "name": "BMW"},
      {"id": 1, "name": "BMW"},
      {"id": 1, "name": "BMW"},
    ],
    "message": "Successfully get companies!"
  };

  Future<List<CompanyModels>> getCompnyModels(int id) async {
    Response response =
        await apiClient.postData('get_room_cars', {'company_id': id});
    printResponseInfo(response);

    List<CompanyModels> list = [];
    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      list = map.map((elemnt) => CompanyModels.fromJson(elemnt)).toList();
      list.forEach((element) {
        debugPrint(element.toString());
      });
      return list;
    } else {
      debugPrint('store repo controller : could not get contest');
      return list;
    }
  }
}
