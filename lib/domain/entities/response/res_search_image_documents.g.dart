// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_search_image_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResSearchImageDocuments _$ResSearchImageDocumentsFromJson(
        Map<String, dynamic> json) =>
    ResSearchImageDocuments(
      json['collection'] as String?,
      json['thumbnail_url'] as String?,
      json['image_url'] as String?,
      json['width'] as int?,
      json['height'] as int?,
      json['display_sitename'] as String?,
      json['doc_url'] as String?,
      json['datetime'] as String?,
    );

Map<String, dynamic> _$ResSearchImageDocumentsToJson(
        ResSearchImageDocuments instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'thumbnail_url': instance.thumbnail_url,
      'image_url': instance.image_url,
      'width': instance.width,
      'height': instance.height,
      'display_sitename': instance.display_sitename,
      'doc_url': instance.doc_url,
      'datetime': instance.datetime,
    };
