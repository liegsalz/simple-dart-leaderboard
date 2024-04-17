import '../repository/player_repository.dart';

PlayerRepository? playerRepository;

PlayerRepository getPlayerRepository() {
  playerRepository ??= PlayerRepository('players.json');

  return playerRepository!;
}
