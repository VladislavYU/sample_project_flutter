import 'package:sample_project/data/service/user_service.dart';
import 'package:sample_project/domain/models/user.dart';
import 'package:sample_project/domain/repository/user_repository.dart';

class UserDataRepository extends UserRepository {
  final UserService _userService;

  UserDataRepository(this._userService);

  @override
  Future<User?> getCurrentUser() async {
    final userMixin = await _userService.getCurrentUser();
    return User(
        firstName: userMixin?.displayName, phone: userMixin?.phoneNumber);
  }

  @override
  Stream<User?> sibscriptionCurrentUser() {
    return _userService.sibsriptionCurrentUser().map((event) =>
        User(firstName: event?.displayName, phone: event?.phoneNumber));
  }
}
