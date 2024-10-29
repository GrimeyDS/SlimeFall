import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slime_fall/firebase_options.dart';
import 'package:slime_fall/main.dart';
import 'package:slime_fall/services/authentication/authentication_service_interface.dart';
import 'package:slime_fall/services//highscore/highscore_constants.dart';
import 'package:slime_fall/services//highscore/highscore_service_interface.dart';

class HighscoreService implements IHighscoreService {
  late IAuthenticationService authService = getIt<IAuthenticationService>();
  late FirebaseFirestore firestore;
  bool isSaving = false;

  HighscoreService() {
    initialize();
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    firestore = FirebaseFirestore.instance;
  }

  @override
  Future<int> getHighScore() async {
    final user = authService.currentUser;
    if (user == null) {
      throw Exception(HighscoreConstants.userNotFound);
    }

    try {
      final docRef = await firestore.collection(HighscoreConstants.dbTable).doc(user.id).get();

      if (docRef.exists) {
        return docRef.data()?[HighscoreConstants.scoreField] ?? 0;
      } 
      else {
        return 0;
      }
    } catch (e) {
      throw Exception(HighscoreConstants.unableToGetScore);
    }
  }

  @override
  Future<void> saveHighScore(int score) async {
    if (isSaving) {
      return;
    }

    final user = authService.currentUser;

    if (user == null) {
      throw Exception(HighscoreConstants.userNotFound);
    }

    isSaving = true;
    try {
      await firestore.collection(HighscoreConstants.dbTable)
                      .doc(user.id)
                      .set({HighscoreConstants.scoreField: score});
    }
    catch (e) {
      isSaving = false;
      throw Exception(HighscoreConstants.unableToSaveScore);
    }
    isSaving = false;
  }
}