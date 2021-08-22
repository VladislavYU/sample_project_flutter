// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

mixin UserMixin {
  @JsonKey(name: '__typename')
  String? $$typename;
  late String id;
  @JsonKey(name: 'created_at')
  late DateTime createdAt;
  @JsonKey(name: 'updated_at')
  late DateTime updatedAt;
  @JsonKey(name: 'display_name')
  String? displayName;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
}
mixin NewsMixin {
  @JsonKey(name: '__typename')
  String? $$typename;
  late String id;
  @JsonKey(name: 'created_at')
  late DateTime createdAt;
  @JsonKey(name: 'updated_at')
  late DateTime updatedAt;
  late String title;
  late String content;
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot$UpdateUsersByPk extends JsonSerializable
    with EquatableMixin {
  UpdateUser$MutationRoot$UpdateUsersByPk();

  factory UpdateUser$MutationRoot$UpdateUsersByPk.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$MutationRoot$UpdateUsersByPkFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUser$MutationRoot$UpdateUsersByPkToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot extends JsonSerializable with EquatableMixin {
  UpdateUser$MutationRoot();

  factory UpdateUser$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRootFromJson(json);

  @JsonKey(name: 'update_users_by_pk')
  UpdateUser$MutationRoot$UpdateUsersByPk? updateUsersByPk;

  @override
  List<Object?> get props => [updateUsersByPk];
  @override
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot$User extends JsonSerializable
    with EquatableMixin, UserMixin {
  GetCurrentUser$QueryRoot$User();

  factory GetCurrentUser$QueryRoot$User.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRoot$UserFromJson(json);

  @override
  List<Object?> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot extends JsonSerializable with EquatableMixin {
  GetCurrentUser$QueryRoot();

  factory GetCurrentUser$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRootFromJson(json);

  GetCurrentUser$QueryRoot$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class News$SubscriptionRoot$News extends JsonSerializable
    with EquatableMixin, NewsMixin {
  News$SubscriptionRoot$News();

  factory News$SubscriptionRoot$News.fromJson(Map<String, dynamic> json) =>
      _$News$SubscriptionRoot$NewsFromJson(json);

  @override
  List<Object?> get props =>
      [$$typename, id, createdAt, updatedAt, title, content];
  @override
  Map<String, dynamic> toJson() => _$News$SubscriptionRoot$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class News$SubscriptionRoot extends JsonSerializable with EquatableMixin {
  News$SubscriptionRoot();

  factory News$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$News$SubscriptionRootFromJson(json);

  late List<News$SubscriptionRoot$News> news;

  @override
  List<Object?> get props => [news];
  @override
  Map<String, dynamic> toJson() => _$News$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsOrderBy extends JsonSerializable with EquatableMixin {
  NewsOrderBy(
      {this.content, this.createdAt, this.id, this.title, this.updatedAt});

  factory NewsOrderBy.fromJson(Map<String, dynamic> json) =>
      _$NewsOrderByFromJson(json);

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy? content;

  @JsonKey(name: 'created_at', unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy? createdAt;

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy? id;

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy? title;

  @JsonKey(name: 'updated_at', unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy? updatedAt;

  @override
  List<Object?> get props => [content, createdAt, id, title, updatedAt];
  @override
  Map<String, dynamic> toJson() => _$NewsOrderByToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot$User extends JsonSerializable
    with EquatableMixin, UserMixin {
  CurrentUser$SubscriptionRoot$User();

  factory CurrentUser$SubscriptionRoot$User.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRoot$UserFromJson(json);

  @override
  List<Object?> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentUser$SubscriptionRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot extends JsonSerializable
    with EquatableMixin {
  CurrentUser$SubscriptionRoot();

  factory CurrentUser$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRootFromJson(json);

  CurrentUser$SubscriptionRoot$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$CurrentUser$SubscriptionRootToJson(this);
}

enum OrderBy {
  @JsonValue('asc')
  asc,
  @JsonValue('asc_nulls_first')
  ascNullsFirst,
  @JsonValue('asc_nulls_last')
  ascNullsLast,
  @JsonValue('desc')
  desc,
  @JsonValue('desc_nulls_first')
  descNullsFirst,
  @JsonValue('desc_nulls_last')
  descNullsLast,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments({required this.id, this.display_name});

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  late String id;

  final String? display_name;

  @override
  List<Object?> get props => [id, display_name];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

final UPDATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'display_name')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'update_users_by_pk'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'pk_columns'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'id'),
                        value: VariableNode(name: NameNode(value: 'id')))
                  ])),
              ArgumentNode(
                  name: NameNode(value: '_set'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'display_name'),
                        value:
                            VariableNode(name: NameNode(value: 'display_name')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$MutationRoot, UpdateUserArguments> {
  UpdateUserMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'UpdateUser';

  @override
  final UpdateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUser$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUser$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUserArguments extends JsonSerializable with EquatableMixin {
  GetCurrentUserArguments({required this.userId});

  @override
  factory GetCurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUserArgumentsToJson(this);
}

final GET_CURRENT_USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCurrentUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'userId')),
            type: NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'users_by_pk'),
            alias: NameNode(value: 'user'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'userId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'User'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'User'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'users'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'created_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'display_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'avatar_url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class GetCurrentUserQuery
    extends GraphQLQuery<GetCurrentUser$QueryRoot, GetCurrentUserArguments> {
  GetCurrentUserQuery({required this.variables});

  @override
  final DocumentNode document = GET_CURRENT_USER_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetCurrentUser';

  @override
  final GetCurrentUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetCurrentUser$QueryRoot parse(Map<String, dynamic> json) =>
      GetCurrentUser$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NewsArguments extends JsonSerializable with EquatableMixin {
  NewsArguments({this.orderBy});

  @override
  factory NewsArguments.fromJson(Map<String, dynamic> json) =>
      _$NewsArgumentsFromJson(json);

  final List<NewsOrderBy>? orderBy;

  @override
  List<Object?> get props => [orderBy];
  @override
  Map<String, dynamic> toJson() => _$NewsArgumentsToJson(this);
}

final NEWS_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'News'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'orderBy')),
            type: ListTypeNode(
                type: NamedTypeNode(
                    name: NameNode(value: 'news_order_by'), isNonNull: true),
                isNonNull: false),
            defaultValue: DefaultValueNode(
                value: ObjectValueNode(fields: [
              ObjectFieldNode(
                  name: NameNode(value: 'created_at'),
                  value: EnumValueNode(name: NameNode(value: 'desc')))
            ])),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'news'),
            alias: NameNode(value: 'news'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'order_by'),
                  value: VariableNode(name: NameNode(value: 'orderBy')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'News'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'News'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'news'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'created_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class NewsSubscription
    extends GraphQLQuery<News$SubscriptionRoot, NewsArguments> {
  NewsSubscription({required this.variables});

  @override
  final DocumentNode document = NEWS_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'News';

  @override
  final NewsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  News$SubscriptionRoot parse(Map<String, dynamic> json) =>
      News$SubscriptionRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserArguments extends JsonSerializable with EquatableMixin {
  CurrentUserArguments({required this.userId});

  @override
  factory CurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$CurrentUserArgumentsToJson(this);
}

final CURRENT_USER_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'CurrentUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'userId')),
            type: NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'users_by_pk'),
            alias: NameNode(value: 'user'),
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'userId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'User'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'User'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'users'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'created_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'display_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'avatar_url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class CurrentUserSubscription
    extends GraphQLQuery<CurrentUser$SubscriptionRoot, CurrentUserArguments> {
  CurrentUserSubscription({required this.variables});

  @override
  final DocumentNode document = CURRENT_USER_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName = 'CurrentUser';

  @override
  final CurrentUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CurrentUser$SubscriptionRoot parse(Map<String, dynamic> json) =>
      CurrentUser$SubscriptionRoot.fromJson(json);
}
