import 'package:car_store_flutter/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/cars/car_model.dart';
import '../../repositories/filter_types.dart';

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
    // buildCitiesList();
    super.onInit();
  }

  void getCars() {
    _carProvider.getCars().then((cars) {
      this.cars = cars;
      tempCars.value = [...cars];
      debugPrint('TempCars: ${tempCars.toString()}');
    });
  }

  // void getStoreCars(int id) {
  //   _carProvider.getStoreCars(id).then((cars) {
  //     storeCars(cars);
  //     debugPrint(cars.toString());
  //   });
  // }

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
    filterCarsByCity(cities[index]);
  }

  void fetchCar(int id) async {
    if (cars.isEmpty) {
      _carProvider.getCars().then((cars) {
        this.cars = cars;
        var car = cars.firstWhere((element) => element.id == id);
        change(car, status: RxStatus.success());
      });
    } else {
      var car = cars.firstWhere((element) => element.id == id);
      change(car, status: RxStatus.success());
    }
  }

  void getCarByName(String name) {
    if (name.isEmpty) {
      clearFilter();
    }
    var tCars = <CarModel>[];
    tCars = [...cars];
    tempCars.assignAll(tCars
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList());
  }

  void clearFilter() {
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    tempCars.assignAll(ttCars);
  }

  void filterCars({
    required FilterTypes filterType,
    required Map<String, dynamic> data,
  }) {
    _carProvider
        .filterCars(
      filterType: filterType,
      data: data,
    )
        .then((cars) {
      // this.cars = cars;
      tempCars.value = [...cars];
      debugPrint('TempCarsFilter Type : ${filterType.toString()}');
      debugPrint('TempCarsFilter : ${tempCars.toString()}');
    });
  }

  void filterCarsByCity(String city) {
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    tempCars.assignAll(ttCars
        .where((element) =>
            element.city_enname.toLowerCase().contains(city.toLowerCase()))
        .toList());
  }

  void filterCarsByCompany(String company) {
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    tempCars.assignAll(ttCars
        .where((element) =>
            element.company.toLowerCase().contains(company.toLowerCase()))
        .toList());
  }

  void filterCarsByStore(String store) {
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    tempCars.assignAll(ttCars
        .where((element) =>
            element.room_name.toLowerCase().contains(store.toLowerCase()))
        .toList());
  }

  void filterCarsByPrice(int min, int max) {
    var ttCars = <CarModel>[];
    ttCars = [...cars];
    tempCars.assignAll(ttCars
        .where((element) => element.price >= min && element.price <= max)
        .toList());
  }

  void filterCarsByDate(int min, int max) {
    var ttCars = <CarModel>[];
    ttCars = [...cars];

    tempCars.assignAll(ttCars
        .where((element) => element.year >= min && element.year <= max)
        .toList());
    tempCars.map((element) => debugPrint('year ${element.year}'));
  }
}
