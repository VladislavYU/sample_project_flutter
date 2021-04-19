// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

mixin UserMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  @JsonKey(name: 'display_name')
  String displayName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
}
mixin NewsMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  String title;
  String content;
}

@JsonSerializable(explicitToJson: true)
class CreateNews$MutationRoot$News with EquatableMixin {
  CreateNews$MutationRoot$News();

  factory CreateNews$MutationRoot$News.fromJson(Map<String, dynamic> json) =>
      _$CreateNews$MutationRoot$NewsFromJson(json);

  @JsonKey(name: 'affected_rows')
  int affectedRows;

  @override
  List<Object> get props => [affectedRows];
  Map<String, dynamic> toJson() => _$CreateNews$MutationRoot$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateNews$MutationRoot with EquatableMixin {
  CreateNews$MutationRoot();

  factory CreateNews$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateNews$MutationRootFromJson(json);

  CreateNews$MutationRoot$News news;

  @override
  List<Object> get props => [news];
  Map<String, dynamic> toJson() => _$CreateNews$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot$User with EquatableMixin, UserMixin {
  GetCurrentUser$QueryRoot$User();

  factory GetCurrentUser$QueryRoot$User.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot with EquatableMixin {
  GetCurrentUser$QueryRoot();

  factory GetCurrentUser$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRootFromJson(json);

  GetCurrentUser$QueryRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot$User with EquatableMixin, UserMixin {
  CurrentUser$SubscriptionRoot$User();

  factory CurrentUser$SubscriptionRoot$User.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber
      ];
  Map<String, dynamic> toJson() =>
      _$CurrentUser$SubscriptionRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot with EquatableMixin {
  CurrentUser$SubscriptionRoot();

  factory CurrentUser$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRootFromJson(json);

  CurrentUser$SubscriptionRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$CurrentUser$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsList$SubscriptionRoot$News with EquatableMixin, NewsMixin {
  NewsList$SubscriptionRoot$News();

  factory NewsList$SubscriptionRoot$News.fromJson(Map<String, dynamic> json) =>
      _$NewsList$SubscriptionRoot$NewsFromJson(json);

  @override
  List<Object> get props =>
      [$$typename, id, createdAt, updatedAt, title, content];
  Map<String, dynamic> toJson() => _$NewsList$SubscriptionRoot$NewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsList$SubscriptionRoot with EquatableMixin {
  NewsList$SubscriptionRoot();

  factory NewsList$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$NewsList$SubscriptionRootFromJson(json);

  List<NewsList$SubscriptionRoot$News> news;

  @override
  List<Object> get props => [news];
  Map<String, dynamic> toJson() => _$NewsList$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsOrderBy with EquatableMixin {
  NewsOrderBy(
      {this.content, this.createdAt, this.id, this.title, this.updatedAt});

  factory NewsOrderBy.fromJson(Map<String, dynamic> json) =>
      _$NewsOrderByFromJson(json);

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy content;

  @JsonKey(name: 'created_at', unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy createdAt;

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy id;

  @JsonKey(unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy title;

  @JsonKey(name: 'updated_at', unknownEnumValue: OrderBy.artemisUnknown)
  OrderBy updatedAt;

  @override
  List<Object> get props => [content, createdAt, id, title, updatedAt];
  Map<String, dynamic> toJson() => _$NewsOrderByToJson(this);
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
class CreateNewsArguments extends JsonSerializable with EquatableMixin {
  CreateNewsArguments({@required this.content, @required this.title});

  @override
  factory CreateNewsArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateNewsArgumentsFromJson(json);

  final String content;

  final String title;

  @override
  List<Object> get props => [content, title];
  @override
  Map<String, dynamic> toJson() => _$CreateNewsArgumentsToJson(this);
}

class CreateNewsMutation
    extends GraphQLQuery<CreateNews$MutationRoot, CreateNewsArguments> {
  CreateNewsMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateNews'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'content')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'title')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_news'),
              alias: NameNode(value: 'news'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'content'),
                          value:
                              VariableNode(name: NameNode(value: 'content'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'title'),
                          value: VariableNode(name: NameNode(value: 'title')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'affected_rows'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateNews';

  @override
  final CreateNewsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateNews$MutationRoot parse(Map<String, dynamic> json) =>
      CreateNews$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUserArguments extends JsonSerializable with EquatableMixin {
  GetCurrentUserArguments({@required this.userId});

  @override
  factory GetCurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUserArgumentsToJson(this);
}

class GetCurrentUserQuery
    extends GraphQLQuery<GetCurrentUser$QueryRoot, GetCurrentUserArguments> {
  GetCurrentUserQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetCurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
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
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
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

  @override
  final String operationName = 'GetCurrentUser';

  @override
  final GetCurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetCurrentUser$QueryRoot parse(Map<String, dynamic> json) =>
      GetCurrentUser$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserArguments extends JsonSerializable with EquatableMixin {
  CurrentUserArguments({@required this.userId});

  @override
  factory CurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$CurrentUserArgumentsToJson(this);
}

class CurrentUserSubscription
    extends GraphQLQuery<CurrentUser$SubscriptionRoot, CurrentUserArguments> {
  CurrentUserSubscription({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'CurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
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
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
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

  @override
  final String operationName = 'CurrentUser';

  @override
  final CurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CurrentUser$SubscriptionRoot parse(Map<String, dynamic> json) =>
      CurrentUser$SubscriptionRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NewsListArguments extends JsonSerializable with EquatableMixin {
  NewsListArguments({this.orderBy});

  @override
  factory NewsListArguments.fromJson(Map<String, dynamic> json) =>
      _$NewsListArgumentsFromJson(json);

  final List<NewsOrderBy> orderBy;

  @override
  List<Object> get props => [orderBy];
  @override
  Map<String, dynamic> toJson() => _$NewsListArgumentsToJson(this);
}

class NewsListSubscription
    extends GraphQLQuery<NewsList$SubscriptionRoot, NewsListArguments> {
  NewsListSubscription({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'NewsList'),
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
                FragmentSpreadNode(
                    name: NameNode(value: 'News'), directives: [])
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

  @override
  final String operationName = 'NewsList';

  @override
  final NewsListArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  NewsList$SubscriptionRoot parse(Map<String, dynamic> json) =>
      NewsList$SubscriptionRoot.fromJson(json);
}
