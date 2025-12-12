import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../database/app_database.dart';
import '../models/game_genre.dart';

abstract class IGameGenreRepository {
  Future<List<GameGenre>> getAllGenres();
  Future<GameGenre?> getGenreById(int id);
  Future<int> insertGenre(GameGenre genre);
  Future<int> updateGenre(GameGenre genre);
  Future<int> deleteGenre(int id);
  Future<List<GameGenre>> searchGenres(String query);
}


@singleton
class GameGenreRepository implements IGameGenreRepository {
  final AppDatabase _database;

  GameGenreRepository(this._database);

  GameGenre _fromDb(GameGenreDb db) {
    return GameGenre(
      id: db.id,
      title: db.title,
      description: db.description,
      iconCode: db.iconCode,
    );
  }

  GameGenresTableCompanion _toCompanion(GameGenre genre) {
    return GameGenresTableCompanion(
      id: genre.id == null ? const Value.absent() : Value(genre.id!),
      title: Value(genre.title),
      description: Value(genre.description),
      iconCode: Value(genre.iconCode),
    );
  }

  @override
  Future<List<GameGenre>> getAllGenres() async {
    final dbResults = await _database.getAllGenresFromDb();
    return dbResults.map(_fromDb).toList();
  }

  @override
  Future<GameGenre?> getGenreById(int id) async {
    final dbResult = await _database.getGenreByIdFromDb(id);
    return dbResult != null ? _fromDb(dbResult) : null;
  }

  @override
  Future<int> insertGenre(GameGenre genre) async {
    return await _database.insertGenreToDb(_toCompanion(genre));
  }

  @override
  Future<int> updateGenre(GameGenre genre) async {
    if (genre.id == null) {
      throw Exception('Cannot update genre without id');
    }
    return await _database.updateGenreInDb(genre.id!, _toCompanion(genre));
  }

  @override
  Future<int> deleteGenre(int id) async {
    return await _database.deleteGenreFromDb(id);
  }

  @override
  Future<List<GameGenre>> searchGenres(String query) async {
    final allGenres = await getAllGenres();
    return allGenres
        .where((genre) =>
    genre.title.toLowerCase().contains(query.toLowerCase()) ||
        genre.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}