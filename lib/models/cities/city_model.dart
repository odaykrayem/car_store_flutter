import 'package:car_store_flutter/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  factory CityModel({
    required int id,
    required String city_enname,
  }) = _CityModel;

  factory CityModel.fromJson(JSON json) => _$CityModelFromJson(json);
}
