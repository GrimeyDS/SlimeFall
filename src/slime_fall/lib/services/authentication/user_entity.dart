import 'package:firebase_auth/firebase_auth.dart' show User;

class UserEntity {
  final String id;
  final String email;
  final bool isVerified;

  const UserEntity({
    required this.id,
    required this.email,
    required this.isVerified,
  });

  factory UserEntity.fromFirebase(User user) => UserEntity(
        id: user.uid,
        email: user.email!,
        isVerified: user.emailVerified,
      );
}