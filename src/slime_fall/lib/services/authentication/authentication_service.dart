import 'package:firebase_core/firebase_core.dart';
import 'package:slime_fall/firebase_options.dart';
import 'package:slime_fall/services/authentication/authentication_service_interface.dart';
import 'package:slime_fall/services/authentication/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;

class AuthenticationService implements IAuthenticationService {

  AuthenticationService() {
    initialize();
  }

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
  Future<bool> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception('Was not able to login user: ${e.message}');
    }
  }

  @override
  Future<bool> register({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception('Was not able to register user: ${e.message}');
    }
  }

}