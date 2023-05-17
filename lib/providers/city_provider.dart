// ignore_for_file: file_names
import '../models/cities/city_model.dart';
import '../repositories/city_repo.dart';

class CityProvider {
  final CityRepository _cityRepository;

  CityProvider(this._cityRepository);

  Future<List<CityModel>> getCities() async {
    var cities = await _cityRepository.getCities();
    return cities;
  }
}
