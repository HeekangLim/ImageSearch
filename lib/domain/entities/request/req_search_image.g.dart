// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_search_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqSearchImage _$ReqSearchImageFromJson(Map<String, dynamic> json) =>
    ReqSearchImage(
      json['query'] as String,
      json['sort'] as String,
      json['page'] as int,
      json['size'] as int,
    );

Map<String, dynamic> _$ReqSearchImageToJson(ReqSearchImage instance) =>
    <String, dynamic>{
      'query': instance.query,
      'sort': instance.sort,
      'page': instance.page,
      'size': instance.size,
    };
