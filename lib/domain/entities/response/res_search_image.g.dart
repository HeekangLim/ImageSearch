// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_search_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResSearchImage _$ResSearchImageFromJson(Map<String, dynamic> json) =>
    ResSearchImage(
      json['meta'] == null
          ? null
          : ResSearchImageMeta.fromJson(json['meta'] as Map<String, dynamic>),
      (json['documents'] as List<dynamic>?)
          ?.map((e) =>
              ResSearchImageDocuments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResSearchImageToJson(ResSearchImage instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'documents': instance.documents,
    };

ResSearchImageMeta _$ResSearchImageMetaFromJson(Map<String, dynamic> json) =>
    ResSearchImageMeta(
      json['total_count'] as int?,
      json['pageable_count'] as int?,
      json['is_end'] as bool?,
    );

Map<String, dynamic> _$ResSearchImageMetaToJson(ResSearchImageMeta instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'pageable_count': instance.pageable_count,
      'is_end': instance.is_end,
    };
