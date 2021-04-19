// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNews$MutationRoot$News _$CreateNews$MutationRoot$NewsFromJson(
    Map<String, dynamic> json) {
  return CreateNews$MutationRoot$News()
    ..affectedRows = json['affected_rows'] as int;
}

Map<String, dynamic> _$CreateNews$MutationRoot$NewsToJson(
    CreateNews$MutationRoot$News instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('affected_rows', instance.affectedRows);
  return val;
}

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

NewsList$SubscriptionRoot$News _$NewsList$SubscriptionRoot$NewsFromJson(
    Map<String, dynamic> json) {
  return NewsList$SubscriptionRoot$News()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..title = json['title'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$NewsList$SubscriptionRoot$NewsToJson(
    NewsList$SubscriptionRoot$News instance) {
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
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  return val;
}

NewsList$SubscriptionRoot _$NewsList$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return NewsList$SubscriptionRoot()
    ..news = (json['news'] as List)
        ?.map((e) => e == null
            ? null
            : NewsList$SubscriptionRoot$News.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsList$SubscriptionRootToJson(
    NewsList$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('news', instance.news?.map((e) => e?.toJson())?.toList());
  return val;
}

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

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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

CreateNewsArguments _$CreateNewsArgumentsFromJson(Map<String, dynamic> json) {
  return CreateNewsArguments(
    content: json['content'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CreateNewsArgumentsToJson(CreateNewsArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('title', instance.title);
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

NewsListArguments _$NewsListArgumentsFromJson(Map<String, dynamic> json) {
  return NewsListArguments(
    orderBy: (json['orderBy'] as List)
        ?.map((e) =>
            e == null ? null : NewsOrderBy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsListArgumentsToJson(NewsListArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderBy', instance.orderBy?.map((e) => e?.toJson())?.toList());
  return val;
}
