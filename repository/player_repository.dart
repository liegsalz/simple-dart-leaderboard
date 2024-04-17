import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:logger/logger.dart';

import '../model/player.dart';

Logger logger = Logger();

class PlayerRepository {
  PlayerRepository(String db) : dbFile = File(db);

  final File dbFile;

  Future<Player?> addPlayer(String name) async {
    final players = await getAllPlayers();

    players.sort((a, b) => int.parse(a.id) - int.parse(b.id));

    final nextId =
        players.isEmpty ? '1' : (int.parse(players.last.id) + 1).toString();

    final newPlayer = Player(nextId, name);
    players.add(Player(nextId, name));
    final jsonData = jsonEncode([for (final p in players) p.toJson()]);
    try {
      await dbFile.writeAsString(jsonData);
    } catch (e) {
      logger.e('Error writing to file: $e');
      return null;
    }
    return newPlayer;
  }

  Future<Player?> addWinForPlayerWithId(String id) async {
    final players = await getAllPlayers();

    final player = players.firstWhere(
      (p) => p.id == id,
    );

    player.score++;
    final updatedPlayers = players.map((p) => p.id == id ? player : p).toList();
    final jsonData = jsonEncode(updatedPlayers.map((p) => p.toJson()).toList());

    try {
      await dbFile.writeAsString(jsonData);
    } catch (e) {
      logger.e('Error writing to file: $e');
      return null;
    }

    return player;
  }

  Future<List<Player>> getAllPlayers() async {
    if (!await dbFile.exists()) {
      return [];
    }

    final jsonData = await dbFile.readAsString();
    final players = <Player>[];

    final decodedData =
        jsonDecode(jsonData.isEmpty ? '[]' : jsonData) as List<dynamic>;

    for (final playerData in decodedData) {
      if (playerData is Map<String, dynamic>) {
        final player = Player.fromJson(playerData);
        players.add(player);
      }
    }

    return players;
  }

  Future<Player?> getPlayerWithId(String id) async {
    final players = await getAllPlayers();
    final foundPlayer = players.firstWhereOrNull(
      (p) => p.id == id,
    );

    return foundPlayer;
  }

  Future<bool> resetDb() async {
    try {
      await dbFile.writeAsString('');
    } catch (e) {
      logger.e('Error writing to file: $e');
      return false;
    }
    return true;
  }
}
