import 'package:firebase_core/firebase_core.dart';
import 'package:slime_fall/firebase_options.dart';
import 'package:slime_fall/services/authentication/authentication_service_interface.dart';
import 'package:slime_fall/services/authentication/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

class AuthenticationService implements IAuthenticationService {
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  UserEntity? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    return UserEntity.fromFirebase(user);
  }

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

}