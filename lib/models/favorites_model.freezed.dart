// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) {
  return _FavoritesModel.fromJson(json);
}

/// @nodoc
mixin _$FavoritesModel {
  String get movieId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritesModelCopyWith<FavoritesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesModelCopyWith<$Res> {
  factory $FavoritesModelCopyWith(
          FavoritesModel value, $Res Function(FavoritesModel) then) =
      _$FavoritesModelCopyWithImpl<$Res, FavoritesModel>;
  @useResult
  $Res call({String movieId, String userId});
}

/// @nodoc
class _$FavoritesModelCopyWithImpl<$Res, $Val extends FavoritesModel>
    implements $FavoritesModelCopyWith<$Res> {
  _$FavoritesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesModelImplCopyWith<$Res>
    implements $FavoritesModelCopyWith<$Res> {
  factory _$$FavoritesModelImplCopyWith(_$FavoritesModelImpl value,
          $Res Function(_$FavoritesModelImpl) then) =
      __$$FavoritesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String movieId, String userId});
}

/// @nodoc
class __$$FavoritesModelImplCopyWithImpl<$Res>
    extends _$FavoritesModelCopyWithImpl<$Res, _$FavoritesModelImpl>
    implements _$$FavoritesModelImplCopyWith<$Res> {
  __$$FavoritesModelImplCopyWithImpl(
      _$FavoritesModelImpl _value, $Res Function(_$FavoritesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? userId = null,
  }) {
    return _then(_$FavoritesModelImpl(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoritesModelImpl
    with DiagnosticableTreeMixin
    implements _FavoritesModel {
  const _$FavoritesModelImpl({required this.movieId, required this.userId});

  factory _$FavoritesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoritesModelImplFromJson(json);

  @override
  final String movieId;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FavoritesModel(movieId: $movieId, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavoritesModel'))
      ..add(DiagnosticsProperty('movieId', movieId))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesModelImpl &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, movieId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesModelImplCopyWith<_$FavoritesModelImpl> get copyWith =>
      __$$FavoritesModelImplCopyWithImpl<_$FavoritesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoritesModelImplToJson(
      this,
    );
  }
}

abstract class _FavoritesModel implements FavoritesModel {
  const factory _FavoritesModel(
      {required final String movieId,
      required final String userId}) = _$FavoritesModelImpl;

  factory _FavoritesModel.fromJson(Map<String, dynamic> json) =
      _$FavoritesModelImpl.fromJson;

  @override
  String get movieId;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesModelImplCopyWith<_$FavoritesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
