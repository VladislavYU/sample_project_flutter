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
    UpdateUser$MutationRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('update_users_by_pk', instance.updateUsersByPk?.toJson());
  return val;
}

CreateNews$MutationRoot$News _$CreateNews$MutationRoot$NewsFromJson(
    Map<String, dynamic> json) {
  return CreateNews$MutationRoot$News()
    ..affectedRows = json['affected_rows'] as int;
}

Map<String, dynamic> _$CreateNews$MutationRoot$NewsToJson(
        CreateNews$MutationRoot$News instance) =>
    <String, dynamic>{
      'affected_rows': instance.affectedRows,
    };

CreateNews$MutationRoot _$CreateNews$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateNews$MutationRoot()
    ..news = json['news'] == null
        ? null
        : CreateNews$MutationRoot$News.fromJson(
            json['news'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateNews$MutationRootToJson(
    CreateNews$MutationRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('news', instance.news?.toJson());
  return val;
}

GetCurrentUser$QueryRoot$User _$GetCurrentUser$QueryRoot$UserFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot$User()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['created_at'] as String)
    ..updatedAt = DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String?
    ..avatarUrl = json['avatar_url'] as String?
    ..phoneNumber = json['phone_number'] as String?;
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
  val['id'] = instance.id;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
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
    News$SubscriptionRoot$News instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  val['id'] = instance.id;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
  val['title'] = instance.title;
  val['content'] = instance.content;
  return val;
}

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
  );
}

Map<String, dynamic> _$NewsOrderByToJson(NewsOrderBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', _$OrderByEnumMap[instance.content]);
  writeNotNull('created_at', _$OrderByEnumMap[instance.createdAt]);
  writeNotNull('id', _$OrderByEnumMap[instance.id]);
  writeNotNull('title', _$OrderByEnumMap[instance.title]);
  writeNotNull('updated_at', _$OrderByEnumMap[instance.updatedAt]);
  return val;
}

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

CurrentUser$SubscriptionRoot$User _$CurrentUser$SubscriptionRoot$UserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot$User()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['created_at'] as String)
    ..updatedAt = DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String?
    ..avatarUrl = json['avatar_url'] as String?
    ..phoneNumber = json['phone_number'] as String?;
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
  val['id'] = instance.id;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
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

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateUserArguments(
    id: json['id'] as String,
    display_name: json['display_name'] as String?,
  );
}

Map<String, dynamic> _$UpdateUserArgumentsToJson(UpdateUserArguments instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('display_name', instance.display_name);
  return val;
}

CreateNewsArguments _$CreateNewsArgumentsFromJson(Map<String, dynamic> json) {
  return CreateNewsArguments(
    content: json['content'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CreateNewsArgumentsToJson(
        CreateNewsArguments instance) =>
    <String, dynamic>{
      'content': instance.content,
      'title': instance.title,
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

Map<String, dynamic> _$NewsArgumentsToJson(NewsArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderBy', instance.orderBy?.map((e) => e.toJson()).toList());
  return val;
}

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
