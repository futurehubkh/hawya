// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  bool success;
  List<MessageElement> message;

  NotificationsModel({
    required this.success,
    required this.message,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        success: json["success"],
        message: List<MessageElement>.from(json["message"].map((x) => MessageElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class MessageElement {
  int id;
  TitleClass title;
  TitleClass message;
  NotifiableType notifiableType;
  int notifiableId;
  ModelType modelType;
  int modelId;
  int seen;
  int userId;
  String? data;
  DateTime createdAt;
  DateTime updatedAt;
  int showClient;
  int showCompany;
  int showPuncher;
  int showEmployee;

  MessageElement({
    required this.id,
    required this.title,
    required this.message,
    required this.notifiableType,
    required this.notifiableId,
    required this.modelType,
    required this.modelId,
    required this.seen,
    required this.userId,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
    required this.showClient,
    required this.showCompany,
    required this.showPuncher,
    required this.showEmployee,
  });

  factory MessageElement.fromJson(Map<String, dynamic> json) => MessageElement(
        id: json["id"],
        title: TitleClass.fromJson(json["title"]),
        message: TitleClass.fromJson(json["message"]),
        notifiableType: notifiableTypeValues.map[json["notifiable_type"]]!,
        notifiableId: json["notifiable_id"],
        modelType: modelTypeValues.map[json["model_type"]]!,
        modelId: json["model_id"],
        seen: json["seen"],
        userId: json["user_id"],
        data: json["data"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        showClient: json["show_client"],
        showCompany: json["show_company"],
        showPuncher: json["show_puncher"],
        showEmployee: json["show_employee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "message": message.toJson(),
        "notifiable_type": notifiableTypeValues.reverse[notifiableType],
        "notifiable_id": notifiableId,
        "model_type": modelTypeValues.reverse[modelType],
        "model_id": modelId,
        "seen": seen,
        "user_id": userId,
        "data": data,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "show_client": showClient,
        "show_company": showCompany,
        "show_puncher": showPuncher,
        "show_employee": showEmployee,
      };
}

class TitleClass {
  String en;
  String ar;

  TitleClass({
    required this.en,
    required this.ar,
  });

  factory TitleClass.fromJson(Map<String, dynamic> json) => TitleClass(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

enum ModelType { APP_MODELS_ORDERING_ORDER }

final modelTypeValues =
    EnumValues({"App\\Models\\Ordering\\Order": ModelType.APP_MODELS_ORDERING_ORDER});

enum NotifiableType { APP_MODELS_USER }

final notifiableTypeValues = EnumValues({"App\\Models\\User": NotifiableType.APP_MODELS_USER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
