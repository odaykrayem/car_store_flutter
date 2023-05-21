import 'package:car_store_flutter/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@freezed
class CarModel with _$CarModel {
  factory CarModel({
    required int id,
    required String name,
    required int price,
    required String company,
    required String finger_door,
    required String sensors,
    required String camera,
    required int wheel_size,
    required String lamps,
    required String auto_park,
    required String cruise_control,
    required String lane_keep_assist,
    required String mirror,
    required String color,
    required String body_type,
    required String import_from,
    required String status,
    required String warranty,
    required String window_type,
    required int air_bags,
    required int screen,
    required String gps,
    required String fridge,
    required int seats,
    required String hud_system,
    required String sound_system,
    required String seats_type,
    required String slide_roof,
    required String seats_color,
    required String transmission,
    required int cylinders,
    required String fuel,
    required String engine,
    required String horsepower,
    required String turbo,
    required String wheel_drive_system,
    required String vehicle_height_control,
    required int room_id,
    required String room_name,
    required String room_details,
    required int vip,
    required String city_enname,
    required String make,
    required String class_s,
    required String phone,
    required String model,
    required String type,
    required String image,
    required int city_id,
    required int year,
    required int model_id,
  }) = _CarModel;

  factory CarModel.fromJson(JSON json) => _$CarModelFromJson(json);
}
