// import 'package:json_annotation/json_annotation.dart';
// import 'base/index.dart';

// part 'notification_payload.g.dart';

// @JsonSerializable()
// class NotificationPayload extends BaseResponse<NotificationPayload> {
//   NotificationPayload({
//     this.id,
//     this.notificationId,
//     this.title,
//     this.body,
//   });
//   factory NotificationPayload.fromJson(Map<String, dynamic> json) => _$NotificationPayloadFromJson(json);

//   int? id;
//   int? notificationId;
//   String? title;
//   String? body;
//   int? elementId;

//   @override
//   NotificationPayload fromJson(Map<String, dynamic> json) => NotificationPayload.fromJson(json);

//   @override
//   List<Object?> get props => <Object>[];

//   Map<String, dynamic> toJson() => _$NotificationPayloadToJson(this);
// }
