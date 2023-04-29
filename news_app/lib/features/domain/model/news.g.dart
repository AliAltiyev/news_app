// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      name: json['name'] as String?,
      category: json['category'] as String?,
      desprition: json['desprition'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'desprition': instance.desprition,
      'image': instance.image,
    };
