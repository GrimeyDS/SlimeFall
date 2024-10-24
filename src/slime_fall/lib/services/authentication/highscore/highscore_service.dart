import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slime_fall/firebase_options.dart';
import 'package:slime_fall/services/authentication/authentication_service.dart';
import 'package:slime_fall/services/authentication/authentication_service_interface.dart';
import 'package:slime_fall/services/authentication/highscore/highscore_service_interface.dart';

class HighscoreService implements IHighscoreService {
  late IAuthenticationService authService;
  late FirebaseFirestore firestore;

  HighscoreService() {
    initialize();
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    authService = AuthenticationService();
    firestore = FirebaseFirestore.instance;
  }

  @override
  Future<List<int>> getHighscores() async {
    final user = authService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }

    List<int> highscores = [];

    try {
      QuerySnapshot querySnapshot = await firestore.collection(user.id).get();
      for (var doc in querySnapshot.docs) {
        highscores.add(doc['score']);
      }
    }
    catch (e) {
      throw Exception('Unable to get highscores');
    }

    highscores.sort((a, b) => b.compareTo(a));
    return highscores.take(5).toList();
  }

  @override
  Future<void> saveHighscore(int score) async {
    final user = authService.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }

    try {
      await firestore.collection(user.id).add({'score': score});
    }
    catch (e) {
      throw Exception('Unable to save highscore');
    }
  }
}