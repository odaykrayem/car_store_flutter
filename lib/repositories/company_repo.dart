import 'package:car_store_flutter/services/networking/print_response_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import '../models/cities/city_model.dart';
import '../models/companies/company_model.dart';
import '../models/companies_test/company.dart';
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

  Future<List<Company>> getCompnaies() async {
    Response response = await apiClient.get('get_companies');
    printResponseInfo(response);
    List<Company> _list = [];

    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => Company.fromJson(elemnt)).toList();
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
