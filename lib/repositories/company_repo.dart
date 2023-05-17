import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import '../models/cities/city_model.dart';
import '../models/companies/company_model.dart';
import '../services/networking/api_client.dart';

class CompanyRepository {
  // final ApiService _apiService;
  final ApiClient apiClient;

  CompanyRepository(this.apiClient);

  var responce = {
    "status": "1",
    "data": [
      {"id": 1, "name": "BMW"}
    ],
    "message": "Successfully get companies!"
  };

  Future<List<CompanyModel>> getCompnaies() async {
    // var response = await _apiService.get(endpoint: '/get_rooms');
    Response response = await apiClient.get('get_companies');

    debugPrint('response=====${response.body}');
    // debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    List<CompanyModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CompanyModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
    } else {
      debugPrint('store repo controller : could not get contest');
      return _list;
    }
  }
}
