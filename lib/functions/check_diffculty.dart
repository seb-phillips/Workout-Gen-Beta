class FeedDifficulty {
  FeedDifficulty({this.difficulty});
  final int difficulty;
  String difficultyString;

  String checkDifficulty() {
    //CALCULATE DIFFICULTY
    if (difficulty == 3) {
      difficultyString = 'HARD';
      print('HARD');
    }
    if (difficulty == 2) {
      difficultyString = 'MEDIUM';
      print('MEDIUM');
    } else if (difficulty == 1) {
      difficultyString = 'EASY';
      print('EASY');
    }
    return difficultyString;
  }
}
