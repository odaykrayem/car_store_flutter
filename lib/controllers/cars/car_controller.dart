import 'package:car_store_flutter/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cars/car_model.dart';

class CarController extends GetxController with StateMixin {
  final CarProvider _carProvider;

  var cars = <CarModel>[];
  var tempCars = <CarModel>[].obs;
  var storeCars = <CarModel>[].obs;
  var isFilterClicked = false.obs;
  var cities = <String>[].obs;
  var selectedCity = 0.obs;

  CarController(this._carProvider);

  @override
  void onInit() {
    getCars();
    buildCitiesList();
    super.onInit();
  }

  void getCars() {
    _carProvider.getCars().then((cars) {
      this.cars = cars;
      tempCars.value = [...cars];
      debugPrint('TempCars: ${tempCars.toString()}');
    });
  }

  void getStoreCars(int id) {
    _carProvider.getStoreCars(id).then((cars) {
      storeCars(cars);
      debugPrint(cars.toString());
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

      tempCars.assignAll(tCars.toList());
      return;
    }
    selectedCity.value = index;

    debugPrint('city :  ${cities.value[index]}');
    debugPrint('cars length : ${cars.length}');
    filterCarsByCity(cities[index]);
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
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    if (name.isEmpty) {
      getCars();
    }
    var tCars = <CarModel>[];
    tCars = [...cars];

    tempCars.assignAll(tCars
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList());
  }

  void filterCarsByCity(String city) {
    // getCars();
    debugPrint('search');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');
    debugPrint('region : ${city}');

    tempCars.assignAll(ttCars
        .where((element) =>
            element.city_enname.toLowerCase().contains(city.toLowerCase()))
        .toList());
    debugPrint('temp : ${tempCars.toString()}');
  }

  void filterCarsByCompany(String company) {
    // getCars();
    debugPrint('search');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');
    debugPrint('region : ${company}');

    tempCars.assignAll(ttCars
        .where((element) =>
            element.company.toLowerCase().contains(company.toLowerCase()))
        .toList());
    debugPrint('temp : ${tempCars.toString()}');
  }

  void filterCarsByStore(String store) {
    // getCars();
    debugPrint('search');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');
    debugPrint('region : ${store}');

    tempCars.assignAll(ttCars
        .where((element) =>
            element.room_name.toLowerCase().contains(store.toLowerCase()))
        .toList());
    debugPrint('temp : ${tempCars.toString()}');
  }

  void filterCarsByPrice(int min, int max) {
    // getCars();
    debugPrint('search');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');

    tempCars.assignAll(ttCars
        .where((element) => element.price >= min && element.price <= max)
        .toList());
    debugPrint('temp : ${tempCars.toString()}');
  }

  void filterCarsByDate(int min, int max) {
    // getCars();
    debugPrint('search');
    debugPrint('min : ${min}');
    debugPrint('max : ${max}');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');

    tempCars.assignAll(ttCars
        .where((element) => element.year >= min && element.year <= max)
        .toList());
    tempCars.map((element) => debugPrint('year ${element.year}'));
    debugPrint('temp : ${tempCars.toString()}');
  }

  void clearFilter() {
    debugPrint('search');
    debugPrint('temp : ${tempCars.length}');
    debugPrint('anotehr : ${cars.length}');
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    debugPrint('temp : ${ttCars.length}');

    tempCars.assignAll(ttCars);
    debugPrint('temp : ${tempCars.toString()}');
  }
}
