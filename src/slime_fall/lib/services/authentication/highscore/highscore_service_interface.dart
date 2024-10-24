
abstract class IHighscoreService {
  Future<void> initialize();
  Future<List<int>> getHighscores();
  Future<void> saveHighscore(int score);
}