
import 'package:json_annotation/json_annotation.dart';

part 'req_search_image.g.dart';

@JsonSerializable()
class ReqSearchImage {

  String query;
  String sort;
  int page;
  int size;

  ReqSearchImage(
      this.query,
      this.sort,
      this.page,
      this.size,
      );

  factory ReqSearchImage.fromJson(Map<String, dynamic> json) => _$ReqSearchImageFromJson(json);
  Map<String, dynamic> toJson() => _$ReqSearchImageToJson(this);
}