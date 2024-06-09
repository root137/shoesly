// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandState {
  /// Index of the brand which is selected
  String get selectedBrandId => throw _privateConstructorUsedError;
  List<Brand> get allBrands => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandStateCopyWith<BrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res, BrandState>;
  @useResult
  $Res call({String selectedBrandId, List<Brand> allBrands});
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res, $Val extends BrandState>
    implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBrandId = null,
    Object? allBrands = null,
  }) {
    return _then(_value.copyWith(
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as String,
      allBrands: null == allBrands
          ? _value.allBrands
          : allBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandStateImplCopyWith<$Res>
    implements $BrandStateCopyWith<$Res> {
  factory _$$BrandStateImplCopyWith(
          _$BrandStateImpl value, $Res Function(_$BrandStateImpl) then) =
      __$$BrandStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedBrandId, List<Brand> allBrands});
}

/// @nodoc
class __$$BrandStateImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$BrandStateImpl>
    implements _$$BrandStateImplCopyWith<$Res> {
  __$$BrandStateImplCopyWithImpl(
      _$BrandStateImpl _value, $Res Function(_$BrandStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBrandId = null,
    Object? allBrands = null,
  }) {
    return _then(_$BrandStateImpl(
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as String,
      allBrands: null == allBrands
          ? _value._allBrands
          : allBrands // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
    ));
  }
}

/// @nodoc

class _$BrandStateImpl implements _BrandState {
  _$BrandStateImpl(
      {this.selectedBrandId = '', required final List<Brand> allBrands})
      : _allBrands = allBrands;

  /// Index of the brand which is selected
  @override
  @JsonKey()
  final String selectedBrandId;
  final List<Brand> _allBrands;
  @override
  List<Brand> get allBrands {
    if (_allBrands is EqualUnmodifiableListView) return _allBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allBrands);
  }

  @override
  String toString() {
    return 'BrandState(selectedBrandId: $selectedBrandId, allBrands: $allBrands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandStateImpl &&
            (identical(other.selectedBrandId, selectedBrandId) ||
                other.selectedBrandId == selectedBrandId) &&
            const DeepCollectionEquality()
                .equals(other._allBrands, _allBrands));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedBrandId,
      const DeepCollectionEquality().hash(_allBrands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      __$$BrandStateImplCopyWithImpl<_$BrandStateImpl>(this, _$identity);
}

abstract class _BrandState implements BrandState {
  factory _BrandState(
      {final String selectedBrandId,
      required final List<Brand> allBrands}) = _$BrandStateImpl;

  @override

  /// Index of the brand which is selected
  String get selectedBrandId;
  @override
  List<Brand> get allBrands;
  @override
  @JsonKey(ignore: true)
  _$$BrandStateImplCopyWith<_$BrandStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
