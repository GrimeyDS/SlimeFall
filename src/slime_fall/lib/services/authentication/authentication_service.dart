import 'package:slime_fall/services/authentication/user_entity.dart';

abstract class AuthenticationService {
  Future<void> initialize();
  UserEntity? get currentUser;
  Future<void> login({ required String email, required String password});
  Future<void> register({ required String email, required String password});
}