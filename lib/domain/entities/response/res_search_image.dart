
import 'package:json_annotation/json_annotation.dart';
import 'package:jvn_project/domain/entities/response/res_search_image_documents.dart';

part 'res_search_image.g.dart';

@JsonSerializable()
class ResSearchImage {

  ResSearchImageMeta? meta;
  List<ResSearchImageDocuments>? documents;
  ResSearchImage(
      this.meta,
      this.documents,
      );

  factory ResSearchImage.fromJson(Map<String, dynamic> json) => _$ResSearchImageFromJson(json);
  Map<String, dynamic> toJson() => _$ResSearchImageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResSearchImageMeta {
  int? total_count;
  int? pageable_count;
  bool? is_end;

  ResSearchImageMeta(
      this.total_count,
      this.pageable_count,
      this.is_end,
      );

  factory ResSearchImageMeta.fromJson(Map<String, dynamic> json) => _$ResSearchImageMetaFromJson(json);
  Map<String, dynamic> toJson() => _$ResSearchImageMetaToJson(this);
}