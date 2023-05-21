import 'package:car_store_flutter/models/cars/car_model.dart';
import 'package:car_store_flutter/services/networking/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../services/networking/print_response_info.dart';
import 'filter_types.dart';

class CarRepository {
  final ApiClient apiClient;
  CarRepository(this.apiClient);

  Future<List<CarModel>> getCars() async {
    Response response = await apiClient.get('get_cars');
    printResponseInfo(response);
    List<CarModel> _list = [];

    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
    } else {
      debugPrint('car repo  : could not get cars');
      return _list;
    }
  }

  Future<List<CarModel>> getBannerCars() async {
    Response response = await apiClient.get('get_cars');
    printResponseInfo(response);
    List<CarModel> _list = [];
    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
    } else {
      return _list;
    }
  }

  Future<List<CarModel>> getVIPCars() async {
    Response response = await apiClient.get('get_vip_cars');
    List<CarModel> _list = [];

    if (response.statusCode == 200) {
      // debugPrint('product  : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
    } else {
      return _list;
    }
  }

  Future<List<CarModel>> getStoreCars(int id) async {
    Response response =
        await apiClient.postData('get_room_cars', {'room_id': id});
    List<CarModel> _list = [];
    printResponseInfo(response);
    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
    } else {
      return _list;
    }
  }

  Future<List<CarModel>> filterCars({
    required FilterTypes filterType,
    required Map<String, dynamic> data,
  }) async {
    List<CarModel> carsList = [];
    late Response response;
    switch (filterType) {
      case FilterTypes.year:
        response = await apiClient.postData('get_year_cars', {
          'low_year': data['low'],
          'high_year': data['high'],
        });
        break;
      case FilterTypes.price:
        response = await apiClient.postData('get_price_cars', {
          'low_price': data['low'],
          'high_price': data['high'],
        });
        break;
      case FilterTypes.company:
        response = await apiClient.postData('get_company_cars', {
          'company_id': data['id'],
        });
        break;
      case FilterTypes.model:
        response = await apiClient.postData('get_model_cars', {
          'model_id': data['id'],
        });
        break;
      case FilterTypes.city:
        response = await apiClient.postData('get_city_cars', {
          'city_id': data['id'],
        });
        break;
      case FilterTypes.exhibition:
        response = await apiClient.postData('get_room_cars', {
          'room_id': data['id'],
        });
        break;
      case FilterTypes.companyModel:
        response = await apiClient.postData('get_model_cars', {
          'company_id': data['company_id'],
          'model_id': data['model_id'],
        });
        break;
    }

    if (response.statusCode == 200) {
      List<dynamic> map = response.body['data'];
      carsList = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      carsList.forEach((element) {
        debugPrint(element.toString());
      });
      return carsList;
    } else {
      debugPrint('car repo Filter : could not get cars');
      return carsList;
    }
  }
}
