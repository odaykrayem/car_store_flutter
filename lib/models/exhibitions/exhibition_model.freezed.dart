// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exhibition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExhibitionModel _$ExhibitionModelFromJson(Map<String, dynamic> json) {
  return _ExhibitionModel.fromJson(json);
}

/// @nodoc
class _$ExhibitionModelTearOff {
  const _$ExhibitionModelTearOff();

  _ExhibitionModel call(
      {required int id, required String name, required String details}) {
    return _ExhibitionModel(
      id: id,
      name: name,
      details: details,
    );
  }

  ExhibitionModel fromJson(Map<String, Object?> json) {
    return ExhibitionModel.fromJson(json);
  }
}

/// @nodoc
const $ExhibitionModel = _$ExhibitionModelTearOff();

/// @nodoc
mixin _$ExhibitionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExhibitionModelCopyWith<ExhibitionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExhibitionModelCopyWith<$Res> {
  factory $ExhibitionModelCopyWith(
          ExhibitionModel value, $Res Function(ExhibitionModel) then) =
      _$ExhibitionModelCopyWithImpl<$Res>;
  $Res call({int id, String name, String details});
}

/// @nodoc
class _$ExhibitionModelCopyWithImpl<$Res>
    implements $ExhibitionModelCopyWith<$Res> {
  _$ExhibitionModelCopyWithImpl(this._value, this._then);

  final ExhibitionModel _value;
  // ignore: unused_field
  final $Res Function(ExhibitionModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? details = freezed,
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
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ExhibitionModelCopyWith<$Res>
    implements $ExhibitionModelCopyWith<$Res> {
  factory _$ExhibitionModelCopyWith(
          _ExhibitionModel value, $Res Function(_ExhibitionModel) then) =
      __$ExhibitionModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String details});
}

/// @nodoc
class __$ExhibitionModelCopyWithImpl<$Res>
    extends _$ExhibitionModelCopyWithImpl<$Res>
    implements _$ExhibitionModelCopyWith<$Res> {
  __$ExhibitionModelCopyWithImpl(
      _ExhibitionModel _value, $Res Function(_ExhibitionModel) _then)
      : super(_value, (v) => _then(v as _ExhibitionModel));

  @override
  _ExhibitionModel get _value => super._value as _ExhibitionModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? details = freezed,
  }) {
    return _then(_ExhibitionModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExhibitionModel implements _ExhibitionModel {
  _$_ExhibitionModel(
      {required this.id, required this.name, required this.details});

  factory _$_ExhibitionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExhibitionModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String details;

  @override
  String toString() {
    return 'ExhibitionModel(id: $id, name: $name, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExhibitionModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$ExhibitionModelCopyWith<_ExhibitionModel> get copyWith =>
      __$ExhibitionModelCopyWithImpl<_ExhibitionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExhibitionModelToJson(this);
  }
}

abstract class _ExhibitionModel implements ExhibitionModel {
  factory _ExhibitionModel(
      {required int id,
      required String name,
      required String details}) = _$_ExhibitionModel;

  factory _ExhibitionModel.fromJson(Map<String, dynamic> json) =
      _$_ExhibitionModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get details;
  @override
  @JsonKey(ignore: true)
  _$ExhibitionModelCopyWith<_ExhibitionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
