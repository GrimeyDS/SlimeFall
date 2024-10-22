import 'package:slime_fall/services/authentication/user_entity.dart';

abstract class IAuthenticationService {
  Future<void> initialize();
  UserEntity? get currentUser;
  Future<bool> login({ required String email, required String password});
  Future<bool> register({ required String email, required String password});
}