import 'package:car_store_flutter/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_models.freezed.dart';
part 'company_models.g.dart';

@freezed
class CompanyModels with _$CompanyModels {
  factory CompanyModels({
    required int id,
    required String name,
    required int company_id,
  }) = _CompanyModels;

  factory CompanyModels.fromJson(JSON json) => _$CompanyModelsFromJson(json);
}
