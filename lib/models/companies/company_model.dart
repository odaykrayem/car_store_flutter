import 'package:car_store_flutter/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    required int id,
    required String name,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(JSON json) => _$CompanyModelFromJson(json);
}
