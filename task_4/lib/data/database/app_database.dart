import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';


@DataClassName('GameGenreDb')
class GameGenresTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get iconCode => text()();
}

@DriftDatabase(tables: [GameGenresTable])
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _seedInitialData();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
      }
    },
  );

  Future<void> _seedInitialData() async {
    final count = await (select(gameGenresTable)..limit(1)).get();
    if (count.isEmpty) {
      await batch((batch) {
        batch.insertAll(gameGenresTable, [
          GameGenresTableCompanion.insert(
            title: 'RPG (Ролевые игры)',
            description: 'Погружение в роль персонажа, развитие навыков и сюжет',
            iconCode: 'people',
          ),
          GameGenresTableCompanion.insert(
            title: 'Шутеры (FPS/TPS)',
            description: 'Динамичные сражения от первого или третьего лица',
            iconCode: 'games',
          ),
          GameGenresTableCompanion.insert(
            title: 'Стратегии (RTS/TBS)',
            description: 'Тактическое планирование и управление ресурсами',
            iconCode: 'map',
          ),
          GameGenresTableCompanion.insert(
            title: 'Приключения (Adventure)',
            description: 'Исследование мира и решение загадок',
            iconCode: 'explore',
          ),
          GameGenresTableCompanion.insert(
            title: 'Гонки (Racing)',
            description: 'Соревнования на скорость и мастерство вождения',
            iconCode: 'directions_car',
          ),
          GameGenresTableCompanion.insert(
            title: 'Симуляторы',
            description: 'Реалистичное воспроизведение различных процессов',
            iconCode: 'flight',
          ),
          GameGenresTableCompanion.insert(
            title: 'Спортивные игры',
            description: 'Виртуальные соревнования в различных видах спорта',
            iconCode: 'sports_soccer',
          ),
          GameGenresTableCompanion.insert(
            title: 'Головоломки (Puzzle)',
            description: 'Логические задачи и испытания для ума',
            iconCode: 'psychology',
          ),
          GameGenresTableCompanion.insert(
            title: 'Хорроры',
            description: 'Напряженная атмосфера и элементы ужасов',
            iconCode: 'nightlight_round',
          ),
          GameGenresTableCompanion.insert(
            title: 'ММО (Многопользовательские)',
            description: 'Массовые онлайн-миры с тысячами игроков',
            iconCode: 'language',
          ),
        ]);
      });
    }
  }

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      if (Platform.isAndroid || Platform.isIOS) {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'gamegenres.db'));
        return NativeDatabase(file);
      } else {
        return NativeDatabase.memory();
      }
    });
  }

  Future<List<GameGenreDb>> getAllGenresFromDb() async {
    return await select(gameGenresTable).get();
  }

  Future<GameGenreDb?> getGenreByIdFromDb(int id) async {
    return await (select(gameGenresTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertGenreToDb(GameGenresTableCompanion genre) async {
    return await into(gameGenresTable).insert(genre);
  }

  Future<int> updateGenreInDb(int id, GameGenresTableCompanion genre) async {
    return await (update(gameGenresTable)..where((tbl) => tbl.id.equals(id)))
        .write(genre);
  }

  Future<int> deleteGenreFromDb(int id) async {
    return await (delete(gameGenresTable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}