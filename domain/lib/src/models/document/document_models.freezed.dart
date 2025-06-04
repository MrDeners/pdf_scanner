// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentData _$DocumentDataFromJson(Map<String, dynamic> json) {
  return _DocumentData.fromJson(json);
}

/// @nodoc
mixin _$DocumentData {
  int? get id => throw _privateConstructorUsedError;
  @FileConverter()
  File get file => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get pagesAmount => throw _privateConstructorUsedError;

  /// Serializes this DocumentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentDataCopyWith<DocumentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDataCopyWith<$Res> {
  factory $DocumentDataCopyWith(
          DocumentData value, $Res Function(DocumentData) then) =
      _$DocumentDataCopyWithImpl<$Res, DocumentData>;
  @useResult
  $Res call(
      {int? id,
      @FileConverter() File file,
      DateTime createdAt,
      String name,
      int pagesAmount});
}

/// @nodoc
class _$DocumentDataCopyWithImpl<$Res, $Val extends DocumentData>
    implements $DocumentDataCopyWith<$Res> {
  _$DocumentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? file = null,
    Object? createdAt = null,
    Object? name = null,
    Object? pagesAmount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pagesAmount: null == pagesAmount
          ? _value.pagesAmount
          : pagesAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentDataImplCopyWith<$Res>
    implements $DocumentDataCopyWith<$Res> {
  factory _$$DocumentDataImplCopyWith(
          _$DocumentDataImpl value, $Res Function(_$DocumentDataImpl) then) =
      __$$DocumentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @FileConverter() File file,
      DateTime createdAt,
      String name,
      int pagesAmount});
}

/// @nodoc
class __$$DocumentDataImplCopyWithImpl<$Res>
    extends _$DocumentDataCopyWithImpl<$Res, _$DocumentDataImpl>
    implements _$$DocumentDataImplCopyWith<$Res> {
  __$$DocumentDataImplCopyWithImpl(
      _$DocumentDataImpl _value, $Res Function(_$DocumentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? file = null,
    Object? createdAt = null,
    Object? name = null,
    Object? pagesAmount = null,
  }) {
    return _then(_$DocumentDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pagesAmount: null == pagesAmount
          ? _value.pagesAmount
          : pagesAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentDataImpl extends _DocumentData {
  const _$DocumentDataImpl(
      {this.id = null,
      @FileConverter() required this.file,
      required this.createdAt,
      this.name = '',
      this.pagesAmount = 1})
      : super._();

  factory _$DocumentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentDataImplFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @FileConverter()
  final File file;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int pagesAmount;

  /// Create a copy of DocumentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDataImplCopyWith<_$DocumentDataImpl> get copyWith =>
      __$$DocumentDataImplCopyWithImpl<_$DocumentDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentDataImplToJson(
      this,
    );
  }
}

abstract class _DocumentData extends DocumentData {
  const factory _DocumentData(
      {final int? id,
      @FileConverter() required final File file,
      required final DateTime createdAt,
      final String name,
      final int pagesAmount}) = _$DocumentDataImpl;
  const _DocumentData._() : super._();

  factory _DocumentData.fromJson(Map<String, dynamic> json) =
      _$DocumentDataImpl.fromJson;

  @override
  int? get id;
  @override
  @FileConverter()
  File get file;
  @override
  DateTime get createdAt;
  @override
  String get name;
  @override
  int get pagesAmount;

  /// Create a copy of DocumentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDataImplCopyWith<_$DocumentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
