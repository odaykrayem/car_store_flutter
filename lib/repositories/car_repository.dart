import 'dart:convert';

import 'package:car_store_flutter/models/cars/car_model.dart';
import 'package:car_store_flutter/services/networking/api_client.dart';
import 'package:car_store_flutter/shared/typedef.dart';
import 'package:car_store_flutter/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CarRepository {
  // final ApiService _apiService;

  final ApiClient apiClient;
  // CarRepository(this._apiService);
  CarRepository(this.apiClient);

  var response = {
    "status": "1",
    "data": [
      {
        "id": 1,
        "name": "name",
        'image': 'assets/images/car1.png',
        'city_enname': 'baghdad',
        "price": 0,
        "company": "company",
        "finger_door": "smart key",
        "sensors": "front & rear",
        "camera": "yes",
        "wheel_size": 21,
        "lamps": "premium led",
        "auto_park": "yes",
        "cruise_control": "yes",
        "lane_keep_assist": "yes",
        "mirror": "electric",
        "color": "black",
        "body_type": "suv",
        "import_from": "usa",
        "status": "no paint",
        "warranty": "warranty",
        "window_type": "power window",
        "air_bags": 10,
        "screen": 1,
        "gps": "no",
        "fridge": "yes",
        "seats": 5,
        "hud_system": "no",
        "sound_system": "meridian",
        "seats_type": "leather",
        "slide_roof": "panoramic roof",
        "seats_color": "black",
        "transmission": "automatic",
        "cylinders": 6,
        "fuel": "petrol",
        "engine": "3.0l",
        "horsepower": "375hp/380ps/280kw",
        "turbo": "supercharged",
        "wheel_drive_system": "awd",
        "vehicle_height_control": "yes",
        "room_id": 1,
        "room_name": "name",
        "room_details": "details",
        "vip": 1
      },
      {
        "id": 2,
        "name": "name",
        'image': 'assets/images/car4.png',
        'city_enname': 'dohuk',
        "price": 0,
        "company": "company",
        "finger_door": "smart key",
        "sensors": "front & rear",
        "camera": "yes",
        "wheel_size": 21,
        "lamps": "premium led",
        "auto_park": "yes",
        "cruise_control": "yes",
        "lane_keep_assist": "yes",
        "mirror": "electric",
        "color": "black",
        "body_type": "suv",
        "import_from": "usa",
        "status": "no paint",
        "warranty": "warranty",
        "window_type": "power window",
        "air_bags": 10,
        "screen": 1,
        "gps": "no",
        "fridge": "yes",
        "seats": 5,
        "hud_system": "no",
        "sound_system": "meridian",
        "seats_type": "leather",
        "slide_roof": "panoramic roof",
        "seats_color": "black",
        "transmission": "automatic",
        "cylinders": 6,
        "fuel": "petrol",
        "engine": "3.0l",
        "horsepower": "375hp/380ps/280kw",
        "turbo": "supercharged",
        "wheel_drive_system": "awd",
        "vehicle_height_control": "yes",
        "room_id": 1,
        "room_name": "name",
        "room_details": "details",
        "vip": 0
      },
      {
        "id": 3,
        "name": "name",
        'image': 'assets/images/car3.png',
        'city_enname': 'erbil',
        "price": 0,
        "company": "company",
        "finger_door": "smart key",
        "sensors": "front & rear",
        "camera": "yes",
        "wheel_size": 21,
        "lamps": "premium led",
        "auto_park": "yes",
        "cruise_control": "yes",
        "lane_keep_assist": "yes",
        "mirror": "electric",
        "color": "black",
        "body_type": "suv",
        "import_from": "usa",
        "status": "no paint",
        "warranty": "warranty",
        "window_type": "power window",
        "air_bags": 10,
        "screen": 1,
        "gps": "no",
        "fridge": "yes",
        "seats": 5,
        "hud_system": "no",
        "sound_system": "meridian",
        "seats_type": "leather",
        "slide_roof": "panoramic roof",
        "seats_color": "black",
        "transmission": "automatic",
        "cylinders": 6,
        "fuel": "petrol",
        "engine": "3.0l",
        "horsepower": "375hp/380ps/280kw",
        "turbo": "supercharged",
        "wheel_drive_system": "awd",
        "vehicle_height_control": "yes",
        "room_id": 1,
        "room_name": "name",
        "room_details": "details",
        "vip": 0
      },
      {
        "id": 4,
        "name": "name",
        'image': 'assets/images/car3.png',
        'city_enname': 'suleymaniyah',
        "price": 0,
        "company": "company",
        "finger_door": "smart key",
        "sensors": "front & rear",
        "camera": "yes",
        "wheel_size": 21,
        "lamps": "premium led",
        "auto_park": "yes",
        "cruise_control": "yes",
        "lane_keep_assist": "yes",
        "mirror": "electric",
        "color": "black",
        "body_type": "suv",
        "import_from": "usa",
        "status": "no paint",
        "warranty": "warranty",
        "window_type": "power window",
        "air_bags": 10,
        "screen": 1,
        "gps": "no",
        "fridge": "yes",
        "seats": 5,
        "hud_system": "no",
        "sound_system": "meridian",
        "seats_type": "leather",
        "slide_roof": "panoramic roof",
        "seats_color": "black",
        "transmission": "automatic",
        "cylinders": 6,
        "fuel": "petrol",
        "engine": "3.0l",
        "horsepower": "375hp/380ps/280kw",
        "turbo": "supercharged",
        "wheel_drive_system": "awd",
        "vehicle_height_control": "yes",
        "room_id": 1,
        "room_name": "name",
        "room_details": "details",
        "vip": 1
      }
    ],
    "message": "Successfully get cars!"
  };

  // Future<List<JSON>> getCars() async {
  // var response = await _apiService.get(endpoint: 'get_cars');
  // debugPrint('response=====${response}');

  // List<JSON> cars = response['data'] as List<JSON>;
  // debugPrint(cars.toList().toString());

  // return cars;
  // }

  Future<List<CarModel>> getCars() async {
    Response response = await apiClient.get('get_cars');

    debugPrint('response=====${response.body}');
    // debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    List<CarModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
      //it works like setState to update ui
    } else {
      debugPrint('car repo controller : could not get contest');
      return _list;
    }
  }

  Future<List<CarModel>> getBannerCars() async {
    Response response = await apiClient.get('get_cars');

    debugPrint('response=====${response.body}');
    // debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    List<CarModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
      //it works like setState to update ui
    } else {
      debugPrint('car repo controller : could not get contest');
      return _list;
    }
  }

  Future<List<CarModel>> getVIPCars() async {
    Response response = await apiClient.get('get_vip_cars');
    List<CarModel> _list = []; //initialze to not repeat data

    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
      //it works like setState to update ui
    } else {
      debugPrint('car repo controller : could not get contest');
      return _list;
    }
  }

  Future<List<CarModel>> getStoreCars(int id) async {
    Response response =
        await apiClient.postData('get_room_cars', {'room_id': id});
    List<CarModel> _list = []; //initialze to not repeat data
    debugPrint('response=====${response.body}');
    debugPrint('Data response=====${response.body['data']}');
    debugPrint('Body responce : ${response.bodyString}');
    debugPrint('Status Code responce : ${response.statusCode}');
    debugPrint('Status Text responce : ${response.statusText}');
    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      List<dynamic> map = response.body['data'];
      _list = map.map((elemnt) => CarModel.fromJson(elemnt)).toList();
      _list.forEach((element) {
        debugPrint(element.toString());
      });
      return _list;
      //it works like setState to update ui
    } else {
      debugPrint('car repo controller : could not get contest');
      return _list;
    }
  }

  // Future<JSON> getCarId(int id) async {
  //   var cars = await getCars();
  //   var car = cars.firstWhere((element) => element['id'] == id);

  //   return car;
  // }
}
