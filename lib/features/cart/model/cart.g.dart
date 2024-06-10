// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      id: json['id'] as String,
      productName: json['productName'] as String,
      productImageUrl: json['productImageUrl'] as String,
      brandName: json['brandName'] as String,
      productColor: json['productColor'] as String,
      productSize: (json['productSize'] as num).toDouble(),
      productPrice: (json['productPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productImageUrl': instance.productImageUrl,
      'brandName': instance.brandName,
      'productColor': instance.productColor,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'quantity': instance.quantity,
    };
