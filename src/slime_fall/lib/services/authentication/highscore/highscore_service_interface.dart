
abstract class IHighscoreService {
  Future<void> initialize();
  Future<int> getHighScore();
  Future<void> saveHighScore(int score);
}