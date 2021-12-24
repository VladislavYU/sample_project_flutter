import 'package:sample_project/controllers/controllers.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';
import 'package:sample_project/extensions.dart';

class UserService {
  final _client = ApiController.client;
  final _user = UserController.to.user;

  Future<UserMixin?> getCurrentUser() async {
    final query = GetCurrentUserQuery(
        variables: GetCurrentUserArguments(userId: _user.value!.id));
    final result = await _client.query(query.qOptions());
    if (result.hasException) result.exception!;
    if (result.data != null) return query.parse(result.data!).user;
  }

  Stream<UserMixin?> sibsriptionCurrentUser() async* {
    final subsribe = CurrentUserSubscription(
        variables: CurrentUserArguments(userId: _user.value!.id));
    yield* _client.subscribe(subsribe.sOptions()).map((event) {
      if (event.data != null) return subsribe.parse(event.data!).user;
    });
  }
}
