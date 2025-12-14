// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GameGenresTableTable extends GameGenresTable
    with TableInfo<$GameGenresTableTable, GameGenreDb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameGenresTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconCodeMeta = const VerificationMeta(
    'iconCode',
  );
  @override
  late final GeneratedColumn<String> iconCode = GeneratedColumn<String>(
    'icon_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, iconCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_genres_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameGenreDb> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_code')) {
      context.handle(
        _iconCodeMeta,
        iconCode.isAcceptableOrUnknown(data['icon_code']!, _iconCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_iconCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameGenreDb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameGenreDb(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_code'],
      )!,
    );
  }

  @override
  $GameGenresTableTable createAlias(String alias) {
    return $GameGenresTableTable(attachedDatabase, alias);
  }
}

class GameGenreDb extends DataClass implements Insertable<GameGenreDb> {
  final int id;
  final String title;
  final String description;
  final String iconCode;
  const GameGenreDb({
    required this.id,
    required this.title,
    required this.description,
    required this.iconCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['icon_code'] = Variable<String>(iconCode);
    return map;
  }

  GameGenresTableCompanion toCompanion(bool nullToAbsent) {
    return GameGenresTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      iconCode: Value(iconCode),
    );
  }

  factory GameGenreDb.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameGenreDb(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      iconCode: serializer.fromJson<String>(json['iconCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'iconCode': serializer.toJson<String>(iconCode),
    };
  }

  GameGenreDb copyWith({
    int? id,
    String? title,
    String? description,
    String? iconCode,
  }) => GameGenreDb(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    iconCode: iconCode ?? this.iconCode,
  );
  GameGenreDb copyWithCompanion(GameGenresTableCompanion data) {
    return GameGenreDb(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconCode: data.iconCode.present ? data.iconCode.value : this.iconCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameGenreDb(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, iconCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameGenreDb &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.iconCode == this.iconCode);
}

class GameGenresTableCompanion extends UpdateCompanion<GameGenreDb> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> iconCode;
  const GameGenresTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.iconCode = const Value.absent(),
  });
  GameGenresTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String iconCode,
  }) : title = Value(title),
       description = Value(description),
       iconCode = Value(iconCode);
  static Insertable<GameGenreDb> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? iconCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (iconCode != null) 'icon_code': iconCode,
    });
  }

  GameGenresTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? iconCode,
  }) {
    return GameGenresTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconCode: iconCode ?? this.iconCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconCode.present) {
      map['icon_code'] = Variable<String>(iconCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameGenresTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameGenresTableTable gameGenresTable = $GameGenresTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameGenresTable];
}

typedef $$GameGenresTableTableCreateCompanionBuilder =
    GameGenresTableCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String iconCode,
    });
typedef $$GameGenresTableTableUpdateCompanionBuilder =
    GameGenresTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> iconCode,
    });

class $$GameGenresTableTableFilterComposer
    extends Composer<_$AppDatabase, $GameGenresTableTable> {
  $$GameGenresTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GameGenresTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GameGenresTableTable> {
  $$GameGenresTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconCode => $composableBuilder(
    column: $table.iconCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GameGenresTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameGenresTableTable> {
  $$GameGenresTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconCode =>
      $composableBuilder(column: $table.iconCode, builder: (column) => column);
}

class $$GameGenresTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameGenresTableTable,
          GameGenreDb,
          $$GameGenresTableTableFilterComposer,
          $$GameGenresTableTableOrderingComposer,
          $$GameGenresTableTableAnnotationComposer,
          $$GameGenresTableTableCreateCompanionBuilder,
          $$GameGenresTableTableUpdateCompanionBuilder,
          (
            GameGenreDb,
            BaseReferences<_$AppDatabase, $GameGenresTableTable, GameGenreDb>,
          ),
          GameGenreDb,
          PrefetchHooks Function()
        > {
  $$GameGenresTableTableTableManager(
    _$AppDatabase db,
    $GameGenresTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameGenresTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameGenresTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameGenresTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconCode = const Value.absent(),
              }) => GameGenresTableCompanion(
                id: id,
                title: title,
                description: description,
                iconCode: iconCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String iconCode,
              }) => GameGenresTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                iconCode: iconCode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameGenresTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameGenresTableTable,
      GameGenreDb,
      $$GameGenresTableTableFilterComposer,
      $$GameGenresTableTableOrderingComposer,
      $$GameGenresTableTableAnnotationComposer,
      $$GameGenresTableTableCreateCompanionBuilder,
      $$GameGenresTableTableUpdateCompanionBuilder,
      (
        GameGenreDb,
        BaseReferences<_$AppDatabase, $GameGenresTableTable, GameGenreDb>,
      ),
      GameGenreDb,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameGenresTableTableTableManager get gameGenresTable =>
      $$GameGenresTableTableTableManager(_db, _db.gameGenresTable);
}
