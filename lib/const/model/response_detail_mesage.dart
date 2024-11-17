import 'package:json_annotation/json_annotation.dart';

part 'response_detail_mesage.g.dart';

@JsonSerializable()
class ResponseDetailMail {
  ResponseDetailMail({
    this.id,
    this.subject,
    this.intro,
    this.createdAt,
    this.updatedAt,
  });

  factory ResponseDetailMail.fromJson(Map<String, dynamic> json) => _$ResponseDetailMailFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'subject')
  final String? subject;
  @JsonKey(name: 'intro')
  final String? intro;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Map<String, dynamic> toJson() => _$ResponseDetailMailToJson(this);
}
