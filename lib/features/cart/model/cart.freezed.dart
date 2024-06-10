// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String get id => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productImageUrl => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get productColor => throw _privateConstructorUsedError;
  double get productSize => throw _privateConstructorUsedError;
  double get productPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String id,
      String productName,
      String productImageUrl,
      String brandName,
      String productColor,
      double productSize,
      double productPrice,
      int quantity});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? productImageUrl = null,
    Object? brandName = null,
    Object? productColor = null,
    Object? productSize = null,
    Object? productPrice = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: null == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      productColor: null == productColor
          ? _value.productColor
          : productColor // ignore: cast_nullable_to_non_nullable
              as String,
      productSize: null == productSize
          ? _value.productSize
          : productSize // ignore: cast_nullable_to_non_nullable
              as double,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productName,
      String productImageUrl,
      String brandName,
      String productColor,
      double productSize,
      double productPrice,
      int quantity});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productName = null,
    Object? productImageUrl = null,
    Object? brandName = null,
    Object? productColor = null,
    Object? productSize = null,
    Object? productPrice = null,
    Object? quantity = null,
  }) {
    return _then(_$CartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: null == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      productColor: null == productColor
          ? _value.productColor
          : productColor // ignore: cast_nullable_to_non_nullable
              as String,
      productSize: null == productSize
          ? _value.productSize
          : productSize // ignore: cast_nullable_to_non_nullable
              as double,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {required this.id,
      required this.productName,
      required this.productImageUrl,
      required this.brandName,
      required this.productColor,
      required this.productSize,
      required this.productPrice,
      required this.quantity});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String id;
  @override
  final String productName;
  @override
  final String productImageUrl;
  @override
  final String brandName;
  @override
  final String productColor;
  @override
  final double productSize;
  @override
  final double productPrice;
  @override
  final int quantity;

  @override
  String toString() {
    return 'Cart(id: $id, productName: $productName, productImageUrl: $productImageUrl, brandName: $brandName, productColor: $productColor, productSize: $productSize, productPrice: $productPrice, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.productColor, productColor) ||
                other.productColor == productColor) &&
            (identical(other.productSize, productSize) ||
                other.productSize == productSize) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, productImageUrl,
      brandName, productColor, productSize, productPrice, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {required final String id,
      required final String productName,
      required final String productImageUrl,
      required final String brandName,
      required final String productColor,
      required final double productSize,
      required final double productPrice,
      required final int quantity}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String get id;
  @override
  String get productName;
  @override
  String get productImageUrl;
  @override
  String get brandName;
  @override
  String get productColor;
  @override
  double get productSize;
  @override
  double get productPrice;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
