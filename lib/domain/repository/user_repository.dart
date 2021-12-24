import 'package:sample_project/domain/models/user.dart';

abstract class UserRepository {
  Future<User?> getCurrentUser();

  Stream<User?> sibscriptionCurrentUser();
}
