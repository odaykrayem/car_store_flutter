import 'package:car_store_flutter/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exhibition_model.freezed.dart';
part 'exhibition_model.g.dart';

@freezed
class ExhibitionModel with _$ExhibitionModel {
  factory ExhibitionModel({
    required int id,
    required String name,
    required String details,
  }) = _ExhibitionModel;

  factory ExhibitionModel.fromJson(JSON json) =>
      _$ExhibitionModelFromJson(json);
}
