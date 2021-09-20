import 'package:json_annotation/json_annotation.dart';

import 'base/api_response.dart';

part 'user.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class SocialUserModel extends BaseResponse<SocialUserModel> {
  SocialUserModel({this.email, this.name, this.uId});
  factory SocialUserModel.fromJson(Map<String, dynamic> json) =>
      _$SocialUserModelFromJson(json);

  String? email;
  String? name;
  String? uId;

  @override
  fromJson(Map<String, dynamic> json) => SocialUserModel.fromJson(json);

  @override
  List<Object?> get props => <Object>[];

  Map<String, dynamic> toJson() => _$SocialUserModelToJson(this);
}
