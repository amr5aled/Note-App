// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUserModel _$SocialUserModelFromJson(Map<String, dynamic> json) {
  return SocialUserModel(
    email: json['email'] as String?,
    name: json['name'] as String?,
    uId: json['uId'] as String?,
  );
}

Map<String, dynamic> _$SocialUserModelToJson(SocialUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'uId': instance.uId,
    };
