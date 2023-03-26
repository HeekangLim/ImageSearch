// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pref_img_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefImgMap _$PrefImgMapFromJson(Map<String, dynamic> json) => PrefImgMap(
      maps: (json['maps'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, ResSearchImageDocuments.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PrefImgMapToJson(PrefImgMap instance) =>
    <String, dynamic>{
      'maps': instance.maps,
    };
