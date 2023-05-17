import 'package:car_store_flutter/models/exhibitions/exhibition_model.dart';
import 'package:car_store_flutter/shared/typedef.dart';
import 'package:car_store_flutter/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

import '../services/networking/api_client.dart';

class ExhibitionRepository {
  // final ApiService _apiService;
  final ApiClient apiClient;

  ExhibitionRepository(this.apiClient);

  var responce = {
    "status": "1",
    "data": [
      {"id": 1, "name": "name1", "details": "details1"},
      {"id": 2, "name": "name2", "details": "details2"},
      {"id": 3, "name": "name3", "details": "details3"},
      {"id": 4, "name": "name4", "details": "details4"},
    ],
    "message": "Successfully get rooms!"
  };

  Future<List<ExhibitionModel>> getStores() async {
    // var response = await _apiService.get(endpoint: '/get_rooms');
    Response response = await apiClient.get('get_rooms');

    debugPrint('response=====${response.body}');
    // debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    List<ExhibitionModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => ExhibitionModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
      //it works like setState to update ui
    } else {
      debugPrint('store repo controller : could not get contest');
      return _list;
    }
  }

  // Future<List<JSON>> getStores() async {
  //   // var response = await _apiService.get(endpoint: '/get_rooms');

  //   List<JSON> stores = responce['data'] as List<JSON>;
  //   debugPrint(stores.toList().toString());

  //   return stores;
  // }
}
