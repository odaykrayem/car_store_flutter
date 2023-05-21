// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyModels _$CompanyModelsFromJson(Map<String, dynamic> json) {
  return _CompanyModels.fromJson(json);
}

/// @nodoc
class _$CompanyModelsTearOff {
  const _$CompanyModelsTearOff();

  _CompanyModels call(
      {required int id, required String name, required int company_id}) {
    return _CompanyModels(
      id: id,
      name: name,
      company_id: company_id,
    );
  }

  CompanyModels fromJson(Map<String, Object?> json) {
    return CompanyModels.fromJson(json);
  }
}

/// @nodoc
const $CompanyModels = _$CompanyModelsTearOff();

/// @nodoc
mixin _$CompanyModels {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get company_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyModelsCopyWith<CompanyModels> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelsCopyWith<$Res> {
  factory $CompanyModelsCopyWith(
          CompanyModels value, $Res Function(CompanyModels) then) =
      _$CompanyModelsCopyWithImpl<$Res>;
  $Res call({int id, String name, int company_id});
}

/// @nodoc
class _$CompanyModelsCopyWithImpl<$Res>
    implements $CompanyModelsCopyWith<$Res> {
  _$CompanyModelsCopyWithImpl(this._value, this._then);

  final CompanyModels _value;
  // ignore: unused_field
  final $Res Function(CompanyModels) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? company_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      company_id: company_id == freezed
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CompanyModelsCopyWith<$Res>
    implements $CompanyModelsCopyWith<$Res> {
  factory _$CompanyModelsCopyWith(
          _CompanyModels value, $Res Function(_CompanyModels) then) =
      __$CompanyModelsCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int company_id});
}

/// @nodoc
class __$CompanyModelsCopyWithImpl<$Res>
    extends _$CompanyModelsCopyWithImpl<$Res>
    implements _$CompanyModelsCopyWith<$Res> {
  __$CompanyModelsCopyWithImpl(
      _CompanyModels _value, $Res Function(_CompanyModels) _then)
      : super(_value, (v) => _then(v as _CompanyModels));

  @override
  _CompanyModels get _value => super._value as _CompanyModels;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? company_id = freezed,
  }) {
    return _then(_CompanyModels(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      company_id: company_id == freezed
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyModels implements _CompanyModels {
  _$_CompanyModels(
      {required this.id, required this.name, required this.company_id});

  factory _$_CompanyModels.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyModelsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int company_id;

  @override
  String toString() {
    return 'CompanyModels(id: $id, name: $name, company_id: $company_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyModels &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.company_id, company_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(company_id));

  @JsonKey(ignore: true)
  @override
  _$CompanyModelsCopyWith<_CompanyModels> get copyWith =>
      __$CompanyModelsCopyWithImpl<_CompanyModels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyModelsToJson(this);
  }
}

abstract class _CompanyModels implements CompanyModels {
  factory _CompanyModels(
      {required int id,
      required String name,
      required int company_id}) = _$_CompanyModels;

  factory _CompanyModels.fromJson(Map<String, dynamic> json) =
      _$_CompanyModels.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get company_id;
  @override
  @JsonKey(ignore: true)
  _$CompanyModelsCopyWith<_CompanyModels> get copyWith =>
      throw _privateConstructorUsedError;
}
