import 'package:car_store_flutter/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cars/car_model.dart';

class StoreCarsController extends GetxController with StateMixin {
  final CarProvider _carProvider;

  var cars = <CarModel>[];
  var storeCars = <CarModel>[].obs;
  var isFilterClicked = false.obs;
  var cities = <String>[].obs;
  var selectedCity = 0.obs;
  int storeId = 0;

  StoreCarsController(this._carProvider);

  @override
  void onInit() {
    buildCitiesList();
    super.onInit();
  }

  void getStoreCars(int id) {
    storeId = id;
    _carProvider.getStoreCars(id).then((cars) {
      this.cars = cars;
      storeCars.value = [...cars];
      change(cars, status: RxStatus.success());

      debugPrint(cars.toString());
    }).catchError((error) {
      change(null, status: RxStatus.error(error));
    });
  }

  void setFilterClicked() {
    if (isFilterClicked.value) {
      selectCity(-1);
    }
    isFilterClicked.value = !isFilterClicked.value;
  }

  void buildCitiesList() {
    cities.value = [
      'baghdad',
      'erbil',
      'dohuk',
      'suleymaniyah',
    ];
  }

  void selectCity(int index) {
    if (index == -1) {
      selectedCity.value = index;
      var tCars = <CarModel>[];
      tCars = [...cars];

      storeCars.assignAll(tCars.toList());
      return;
    }
    selectedCity.value = index;

    debugPrint('city :  ${cities.value[index]}');
    debugPrint('cars length : ${cars.length}');
    getCarByRegion(cities[index]);
  }

  void fetchCar(int id) async {
    if (cars.isEmpty) {
      _carProvider.getCars().then((cars) {
        this.cars = cars;
        var car = cars.firstWhere((element) => element.id == id);

        change(car, status: RxStatus.success());
        debugPrint('fetch all cars');
      });
    } else {
      debugPrint('fetch one car');

      var car = cars.firstWhere((element) => element.id == id);

      change(car, status: RxStatus.success());
    }

    // _carProvider.getCarById(id).then((car) {
    //   change(car, status: RxStatus.success());
    // }).catchError((error) {
    //   change(null, status: RxStatus.error(error));
    // });
  }

  void getCarByName(String name) {
    debugPrint('search');
    debugPrint('temp : ${storeCars.length}');
    debugPrint('anotehr : ${cars.length}');
    if (name.isEmpty) {
      getStoreCars(storeId);
    }
    var tCars = <CarModel>[];
    tCars = [...cars];

    storeCars.assignAll(tCars
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList());
  }

  void getCarByRegion(String region) {
    // getCars();
    debugPrint('search');
    debugPrint('temp : ${storeCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');
    debugPrint('region : ${region}');

    storeCars.assignAll(ttCars
        .where((element) =>
            element.city_enname.toLowerCase().contains(region.toLowerCase()))
        .toList());
    debugPrint('temp : ${storeCars.toString()}');
  }
}
