import 'package:slime_fall/services/authentication/user_entity.dart';

abstract class IAuthenticationService {
  Future<void> initialize();
  UserEntity? get currentUser;
  Future<UserEntity> login({ required String email, required String password});
  Future<UserEntity> register({ required String email, required String password});
}