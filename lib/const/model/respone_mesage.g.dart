// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respone_mesage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMail _$ResponseMailFromJson(Map<String, dynamic> json) => ResponseMail(
      totalItems: (json['hydra:totalItems'] as num?)?.toInt(),
      member: (json['hydra:member'] as List<dynamic>?)
          ?.map((e) => ResponseDetailMail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseMailToJson(ResponseMail instance) =>
    <String, dynamic>{
      'hydra:totalItems': instance.totalItems,
      'hydra:member': instance.member,
    };
