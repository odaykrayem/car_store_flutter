// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
class _$CityModelTearOff {
  const _$CityModelTearOff();

  _CityModel call({required int id, required String city_enname}) {
    return _CityModel(
      id: id,
      city_enname: city_enname,
    );
  }

  CityModel fromJson(Map<String, Object?> json) {
    return CityModel.fromJson(json);
  }
}

/// @nodoc
const $CityModel = _$CityModelTearOff();

/// @nodoc
mixin _$CityModel {
  int get id => throw _privateConstructorUsedError;
  String get city_enname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res>;
  $Res call({int id, String city_enname});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res> implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  final CityModel _value;
  // ignore: unused_field
  final $Res Function(CityModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? city_enname = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city_enname: city_enname == freezed
          ? _value.city_enname
          : city_enname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(
          _CityModel value, $Res Function(_CityModel) then) =
      __$CityModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String city_enname});
}

/// @nodoc
class __$CityModelCopyWithImpl<$Res> extends _$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(_CityModel _value, $Res Function(_CityModel) _then)
      : super(_value, (v) => _then(v as _CityModel));

  @override
  _CityModel get _value => super._value as _CityModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? city_enname = freezed,
  }) {
    return _then(_CityModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city_enname: city_enname == freezed
          ? _value.city_enname
          : city_enname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityModel implements _CityModel {
  _$_CityModel({required this.id, required this.city_enname});

  factory _$_CityModel.fromJson(Map<String, dynamic> json) =>
      _$$_CityModelFromJson(json);

  @override
  final int id;
  @override
  final String city_enname;

  @override
  String toString() {
    return 'CityModel(id: $id, city_enname: $city_enname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.city_enname, city_enname));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(city_enname));

  @JsonKey(ignore: true)
  @override
  _$CityModelCopyWith<_CityModel> get copyWith =>
      __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityModelToJson(this);
  }
}

abstract class _CityModel implements CityModel {
  factory _CityModel({required int id, required String city_enname}) =
      _$_CityModel;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$_CityModel.fromJson;

  @override
  int get id;
  @override
  String get city_enname;
  @override
  @JsonKey(ignore: true)
  _$CityModelCopyWith<_CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
