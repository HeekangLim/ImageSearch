
import 'package:json_annotation/json_annotation.dart';

part 'res_search_image_documents.g.dart';

@JsonSerializable()
class ResSearchImageDocuments {
  String? collection;
  String? thumbnail_url;
  String? image_url;
  int? width;
  int? height;
  String? display_sitename;
  String? doc_url;
  String? datetime;

  ResSearchImageDocuments(
      this.collection,
      this.thumbnail_url,
      this.image_url,
      this.width,
      this.height,
      this.display_sitename,
      this.doc_url,
      this.datetime,
      );

  factory ResSearchImageDocuments.fromJson(Map<String, dynamic> json) => _$ResSearchImageDocumentsFromJson(json);
  Map<String, dynamic> toJson() => _$ResSearchImageDocumentsToJson(this);
}