// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_detail_mesage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDetailMail _$ResponseDetailMailFromJson(Map<String, dynamic> json) =>
    ResponseDetailMail(
      id: json['id'] as String?,
      subject: json['subject'] as String?,
      intro: json['intro'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ResponseDetailMailToJson(ResponseDetailMail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'intro': instance.intro,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
