// ignore_for_file: file_names
import 'package:car_store_flutter/repositories/car_repository.dart';
import '../models/cars/car_model.dart';
import '../repositories/filter_types.dart';

class CarProvider {
  final CarRepository _carRepository;

  CarProvider(this._carRepository);

  Future<List<CarModel>> getCars() async {
    var cars = await _carRepository.getCars();

    // return cars.map((car) => CarModel.fromJson(car)).toList();
    return cars;
  }

  Future<List<CarModel>> getBannerCars() async {
    var cars = await _carRepository.getBannerCars();

    return cars;
  }

  Future<List<CarModel>> getVIPcars() async {
    var cars = await _carRepository.getVIPCars();

    return cars;
  }

  Future<List<CarModel>> getStoreCars(int id) async {
    var cars = await _carRepository.getStoreCars(id);

    return cars;
  }

  Future<List<CarModel>> filterCars({
    required FilterTypes filterType,
    required Map<String, dynamic> data,
  }) async {
    var cars = await _carRepository.filterCars(
      filterType: filterType,
      data: data,
    );

    return cars;
  }

  // Future<CarModel> getCarById(int id) async {
  //   var car = await _carRepository.getCarId(id);

  //   return CarModel.fromJson(car);
  // }
}
