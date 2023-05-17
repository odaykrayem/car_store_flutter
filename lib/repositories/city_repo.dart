import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import '../models/cities/city_model.dart';
import '../services/networking/api_client.dart';

class CityRepository {
  // final ApiService _apiService;
  final ApiClient apiClient;

  CityRepository(this.apiClient);

  var responce = {
    "status": "1",
    "data": [
      {
        "id": 1,
        "city_arname": "اربيل",
        "city_enname": "erbil",
        "city_kuname": "Hewlêr"
      }
    ],
    "message": "Successfully get cities!"
  };

  Future<List<CityModel>> getCities() async {
    // var response = await _apiService.get(endpoint: '/get_rooms');
    Response response = await apiClient.get('get_cities');

    debugPrint('response=====${response.body}');
    // debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    List<CityModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CityModel.fromJson(elemnt)).toList();
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
