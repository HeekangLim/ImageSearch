import 'package:json_annotation/json_annotation.dart';
import 'package:jvn_project/domain/entities/response/res_search_image_documents.dart';

part 'pref_img_map.g.dart';

@JsonSerializable()
class PrefImgMap {
  final Map<String, ResSearchImageDocuments> maps;

  PrefImgMap({
    required this.maps,
  });

  factory PrefImgMap.fromJson(Map<String, dynamic> json) => _$PrefImgMapFromJson(json);

  Map<String, dynamic> toJson() => _$PrefImgMapToJson(this);
}