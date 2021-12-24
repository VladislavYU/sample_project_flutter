// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUser$MutationRoot$UpdateUsersByPk
    _$UpdateUser$MutationRoot$UpdateUsersByPkFromJson(
        Map<String, dynamic> json) {
  return UpdateUser$MutationRoot$UpdateUsersByPk()..id = json['id'] as String;
}

Map<String, dynamic> _$UpdateUser$MutationRoot$UpdateUsersByPkToJson(
        UpdateUser$MutationRoot$UpdateUsersByPk instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateUser$MutationRoot _$UpdateUser$MutationRootFromJson(
    Map<String, dynamic> json) {
  return UpdateUser$MutationRoot()
    ..updateUsersByPk = json['update_users_by_pk'] == null
        ? null
        : UpdateUser$MutationRoot$UpdateUsersByPk.fromJson(
            json['update_users_by_pk'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUser$MutationRootToJson(
        UpdateUser$MutationRoot instance) =>
    <String, dynamic>{
      'update_users_by_pk': instance.updateUsersByPk?.toJson(),
    };

GetCurrentUser$QueryRoot$User _$GetCurrentUser$QueryRoot$UserFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot$User()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..displayName = json['display_name'] as String?
    ..phoneNumber = json['phone_number'] as String?;
}

Map<String, dynamic> _$GetCurrentUser$QueryRoot$UserToJson(
        GetCurrentUser$QueryRoot$User instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'display_name': instance.displayName,
      'phone_number': instance.phoneNumber,
    };

GetCurrentUser$QueryRoot _$GetCurrentUser$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot()
    ..user = json['user'] == null
        ? null
        : GetCurrentUser$QueryRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetCurrentUser$QueryRootToJson(
        GetCurrentUser$QueryRoot instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

News$SubscriptionRoot$News _$News$SubscriptionRoot$NewsFromJson(
    Map<String, dynamic> json) {
  return News$SubscriptionRoot$News()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['created_at'] as String)
    ..updatedAt = DateTime.parse(json['updated_at'] as String)
    ..title = json['title'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$News$SubscriptionRoot$NewsToJson(
        News$SubscriptionRoot$News instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'content': instance.content,
    };

News$SubscriptionRoot _$News$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return News$SubscriptionRoot()
    ..news = (json['news'] as List<dynamic>)
        .map((e) =>
            News$SubscriptionRoot$News.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$News$SubscriptionRootToJson(
        News$SubscriptionRoot instance) =>
    <String, dynamic>{
      'news': instance.news.map((e) => e.toJson()).toList(),
    };

NewsOrderBy _$NewsOrderByFromJson(Map<String, dynamic> json) {
  return NewsOrderBy(
    author: json['author'] == null
        ? null
        : UsersOrderBy.fromJson(json['author'] as Map<String, dynamic>),
    content: _$enumDecodeNullable(_$OrderByEnumMap, json['content'],
        unknownValue: OrderBy.artemisUnknown),
    createdAt: _$enumDecodeNullable(_$OrderByEnumMap, json['created_at'],
        unknownValue: OrderBy.artemisUnknown),
    id: _$enumDecodeNullable(_$OrderByEnumMap, json['id'],
        unknownValue: OrderBy.artemisUnknown),
    title: _$enumDecodeNullable(_$OrderByEnumMap, json['title'],
        unknownValue: OrderBy.artemisUnknown),
    updatedAt: _$enumDecodeNullable(_$OrderByEnumMap, json['updated_at'],
        unknownValue: OrderBy.artemisUnknown),
    userId: _$enumDecodeNullable(_$OrderByEnumMap, json['user_id'],
        unknownValue: OrderBy.artemisUnknown),
  );
}

Map<String, dynamic> _$NewsOrderByToJson(NewsOrderBy instance) =>
    <String, dynamic>{
      'author': instance.author?.toJson(),
      'content': _$OrderByEnumMap[instance.content],
      'created_at': _$OrderByEnumMap[instance.createdAt],
      'id': _$OrderByEnumMap[instance.id],
      'title': _$OrderByEnumMap[instance.title],
      'updated_at': _$OrderByEnumMap[instance.updatedAt],
      'user_id': _$OrderByEnumMap[instance.userId],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$OrderByEnumMap = {
  OrderBy.asc: 'asc',
  OrderBy.ascNullsFirst: 'asc_nulls_first',
  OrderBy.ascNullsLast: 'asc_nulls_last',
  OrderBy.desc: 'desc',
  OrderBy.descNullsFirst: 'desc_nulls_first',
  OrderBy.descNullsLast: 'desc_nulls_last',
  OrderBy.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UsersOrderBy _$UsersOrderByFromJson(Map<String, dynamic> json) {
  return UsersOrderBy(
    account: json['account'] == null
        ? null
        : AuthAccountsOrderBy.fromJson(json['account'] as Map<String, dynamic>),
    avatarUrl: _$enumDecodeNullable(_$OrderByEnumMap, json['avatar_url'],
        unknownValue: OrderBy.artemisUnknown),
    createdAt: _$enumDecodeNullable(_$OrderByEnumMap, json['created_at'],
        unknownValue: OrderBy.artemisUnknown),
    displayName: _$enumDecodeNullable(_$OrderByEnumMap, json['display_name'],
        unknownValue: OrderBy.artemisUnknown),
    id: _$enumDecodeNullable(_$OrderByEnumMap, json['id'],
        unknownValue: OrderBy.artemisUnknown),
    phoneNumber: _$enumDecodeNullable(_$OrderByEnumMap, json['phone_number'],
        unknownValue: OrderBy.artemisUnknown),
    updatedAt: _$enumDecodeNullable(_$OrderByEnumMap, json['updated_at'],
        unknownValue: OrderBy.artemisUnknown),
  );
}

Map<String, dynamic> _$UsersOrderByToJson(UsersOrderBy instance) =>
    <String, dynamic>{
      'account': instance.account?.toJson(),
      'avatar_url': _$OrderByEnumMap[instance.avatarUrl],
      'created_at': _$OrderByEnumMap[instance.createdAt],
      'display_name': _$OrderByEnumMap[instance.displayName],
      'id': _$OrderByEnumMap[instance.id],
      'phone_number': _$OrderByEnumMap[instance.phoneNumber],
      'updated_at': _$OrderByEnumMap[instance.updatedAt],
    };

AuthAccountsOrderBy _$AuthAccountsOrderByFromJson(Map<String, dynamic> json) {
  return AuthAccountsOrderBy(
    active: _$enumDecodeNullable(_$OrderByEnumMap, json['active'],
        unknownValue: OrderBy.artemisUnknown),
    createdAt: _$enumDecodeNullable(_$OrderByEnumMap, json['created_at'],
        unknownValue: OrderBy.artemisUnknown),
    customRegisterData: _$enumDecodeNullable(
        _$OrderByEnumMap, json['custom_register_data'],
        unknownValue: OrderBy.artemisUnknown),
    defaultRole: _$enumDecodeNullable(_$OrderByEnumMap, json['default_role'],
        unknownValue: OrderBy.artemisUnknown),
    email: _$enumDecodeNullable(_$OrderByEnumMap, json['email'],
        unknownValue: OrderBy.artemisUnknown),
    firebaseUid: _$enumDecodeNullable(_$OrderByEnumMap, json['firebase_uid'],
        unknownValue: OrderBy.artemisUnknown),
    id: _$enumDecodeNullable(_$OrderByEnumMap, json['id'],
        unknownValue: OrderBy.artemisUnknown),
    isAnonymous: _$enumDecodeNullable(_$OrderByEnumMap, json['is_anonymous'],
        unknownValue: OrderBy.artemisUnknown),
    mfaEnabled: _$enumDecodeNullable(_$OrderByEnumMap, json['mfa_enabled'],
        unknownValue: OrderBy.artemisUnknown),
    newEmail: _$enumDecodeNullable(_$OrderByEnumMap, json['new_email'],
        unknownValue: OrderBy.artemisUnknown),
    otpSecret: _$enumDecodeNullable(_$OrderByEnumMap, json['otp_secret'],
        unknownValue: OrderBy.artemisUnknown),
    passwordHash: _$enumDecodeNullable(_$OrderByEnumMap, json['password_hash'],
        unknownValue: OrderBy.artemisUnknown),
    phoneNumber: _$enumDecodeNullable(_$OrderByEnumMap, json['phone_number'],
        unknownValue: OrderBy.artemisUnknown),
    role: json['role'] == null
        ? null
        : AuthRolesOrderBy.fromJson(json['role'] as Map<String, dynamic>),
    ticket: _$enumDecodeNullable(_$OrderByEnumMap, json['ticket'],
        unknownValue: OrderBy.artemisUnknown),
    ticketExpiresAt: _$enumDecodeNullable(
        _$OrderByEnumMap, json['ticket_expires_at'],
        unknownValue: OrderBy.artemisUnknown),
    updatedAt: _$enumDecodeNullable(_$OrderByEnumMap, json['updated_at'],
        unknownValue: OrderBy.artemisUnknown),
    user: json['user'] == null
        ? null
        : UsersOrderBy.fromJson(json['user'] as Map<String, dynamic>),
    userId: _$enumDecodeNullable(_$OrderByEnumMap, json['user_id'],
        unknownValue: OrderBy.artemisUnknown),
  );
}

Map<String, dynamic> _$AuthAccountsOrderByToJson(
        AuthAccountsOrderBy instance) =>
    <String, dynamic>{
      'active': _$OrderByEnumMap[instance.active],
      'created_at': _$OrderByEnumMap[instance.createdAt],
      'custom_register_data': _$OrderByEnumMap[instance.customRegisterData],
      'default_role': _$OrderByEnumMap[instance.defaultRole],
      'email': _$OrderByEnumMap[instance.email],
      'firebase_uid': _$OrderByEnumMap[instance.firebaseUid],
      'id': _$OrderByEnumMap[instance.id],
      'is_anonymous': _$OrderByEnumMap[instance.isAnonymous],
      'mfa_enabled': _$OrderByEnumMap[instance.mfaEnabled],
      'new_email': _$OrderByEnumMap[instance.newEmail],
      'otp_secret': _$OrderByEnumMap[instance.otpSecret],
      'password_hash': _$OrderByEnumMap[instance.passwordHash],
      'phone_number': _$OrderByEnumMap[instance.phoneNumber],
      'role': instance.role?.toJson(),
      'ticket': _$OrderByEnumMap[instance.ticket],
      'ticket_expires_at': _$OrderByEnumMap[instance.ticketExpiresAt],
      'updated_at': _$OrderByEnumMap[instance.updatedAt],
      'user': instance.user?.toJson(),
      'user_id': _$OrderByEnumMap[instance.userId],
    };

AuthRolesOrderBy _$AuthRolesOrderByFromJson(Map<String, dynamic> json) {
  return AuthRolesOrderBy(
    role: _$enumDecodeNullable(_$OrderByEnumMap, json['role'],
        unknownValue: OrderBy.artemisUnknown),
  );
}

Map<String, dynamic> _$AuthRolesOrderByToJson(AuthRolesOrderBy instance) =>
    <String, dynamic>{
      'role': _$OrderByEnumMap[instance.role],
    };

CurrentUser$SubscriptionRoot$User _$CurrentUser$SubscriptionRoot$UserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot$User()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..displayName = json['display_name'] as String?
    ..phoneNumber = json['phone_number'] as String?;
}

Map<String, dynamic> _$CurrentUser$SubscriptionRoot$UserToJson(
        CurrentUser$SubscriptionRoot$User instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'display_name': instance.displayName,
      'phone_number': instance.phoneNumber,
    };

CurrentUser$SubscriptionRoot _$CurrentUser$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot()
    ..user = json['user'] == null
        ? null
        : CurrentUser$SubscriptionRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$SubscriptionRootToJson(
        CurrentUser$SubscriptionRoot instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateUserArguments(
    id: json['id'] as String,
    display_name: json['display_name'] as String?,
  );
}

Map<String, dynamic> _$UpdateUserArgumentsToJson(
        UpdateUserArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.display_name,
    };

GetCurrentUserArguments _$GetCurrentUserArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetCurrentUserArgumentsToJson(
        GetCurrentUserArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

NewsArguments _$NewsArgumentsFromJson(Map<String, dynamic> json) {
  return NewsArguments(
    orderBy: (json['orderBy'] as List<dynamic>?)
        ?.map((e) => NewsOrderBy.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewsArgumentsToJson(NewsArguments instance) =>
    <String, dynamic>{
      'orderBy': instance.orderBy?.map((e) => e.toJson()).toList(),
    };

CurrentUserArguments _$CurrentUserArgumentsFromJson(Map<String, dynamic> json) {
  return CurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CurrentUserArgumentsToJson(
        CurrentUserArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };
