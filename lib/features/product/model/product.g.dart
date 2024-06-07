// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      description: json['description'] as String,
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      gender: json['gender'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageUrls': instance.imageUrls,
      'sizes': instance.sizes,
      'description': instance.description,
      'colors': instance.colors,
      'gender': instance.gender,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
    };
