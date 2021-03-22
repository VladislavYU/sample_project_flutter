import 'package:artemis/artemis.dart';
import 'package:gql/ast.dart';
// ignore_for_file: deprecated_member_use_from_same_package
import 'package:graphql/src/core/_base_options.dart' as gql_options;
import 'package:graphql_flutter/graphql_flutter.dart';

extension GraphQLQueryExtension on GraphQLQuery {
  gql_options.BaseOptions options({FetchPolicy fetchPolicy}) {
    final definitions =
        document.definitions.whereType<OperationDefinitionNode>().toList();
    if (operationName != null) {
      definitions.removeWhere((node) => node.name.value != operationName);
    }

    final type = definitions.first.type;
    switch (type) {
      case OperationType.mutation:
        return MutationOptions(
            operationName: operationName,
            document: document,
            variables: getVariablesMap(),
            fetchPolicy: fetchPolicy);

      case OperationType.subscription:
        return SubscriptionOptions(
          operationName: operationName,
          document: document,
          variables: getVariablesMap(),
          fetchPolicy: fetchPolicy,
        );

      default:
        return WatchQueryOptions(
          operationName: operationName,
          document: document,
          variables: getVariablesMap(),
          fetchPolicy: fetchPolicy,
          fetchResults: true,
        );
    }
  }
}
