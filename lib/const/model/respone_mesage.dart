import 'package:animal_ar/const/model/response_detail_mesage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'respone_mesage.g.dart';

@JsonSerializable()
class ResponseMail {
  ResponseMail({
    this.totalItems,
    this.member,
  });

  factory ResponseMail.fromJson(Map<String, dynamic> json) => _$ResponseMailFromJson(json);

  @JsonKey(name: 'hydra:totalItems')
  final int? totalItems;
  @JsonKey(name: 'hydra:member')
  final List<ResponseDetailMail>? member;

  Map<String, dynamic> toJson() => _$ResponseMailToJson(this);
}
