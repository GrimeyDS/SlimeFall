import 'package:firebase_core/firebase_core.dart';
import 'package:slime_fall/firebase_options.dart';
import 'package:slime_fall/services/authentication/highscore/highscore_service_interface.dart';

class HighscoreService implements IHighscoreService {

  HighscoreService() {
    initialize();
  }

    @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}