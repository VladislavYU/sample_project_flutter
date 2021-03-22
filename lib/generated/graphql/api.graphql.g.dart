// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUser$SubscriptionRoot$User _$CurrentUser$SubscriptionRoot$UserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String;
}

Map<String, dynamic> _$CurrentUser$SubscriptionRoot$UserToJson(
    CurrentUser$SubscriptionRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

CurrentUser$SubscriptionRoot _$CurrentUser$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot()
    ..user = json['user'] == null
        ? null
        : CurrentUser$SubscriptionRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$SubscriptionRootToJson(
    CurrentUser$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

GetCurrentUser$QueryRoot$User _$GetCurrentUser$QueryRoot$UserFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String;
}

Map<String, dynamic> _$GetCurrentUser$QueryRoot$UserToJson(
    GetCurrentUser$QueryRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

GetCurrentUser$QueryRoot _$GetCurrentUser$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot()
    ..user = json['user'] == null
        ? null
        : GetCurrentUser$QueryRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetCurrentUser$QueryRootToJson(
    GetCurrentUser$QueryRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

CurrentUserArguments _$CurrentUserArgumentsFromJson(Map<String, dynamic> json) {
  return CurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CurrentUserArgumentsToJson(
    CurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}

GetCurrentUserArguments _$GetCurrentUserArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetCurrentUserArgumentsToJson(
    GetCurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}
