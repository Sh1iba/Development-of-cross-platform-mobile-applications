// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import '../data/database/app_database.dart' as _i704;
import '../data/repositories/game_genre_repository.dart' as _i856;
import '../pages/home/bloc/home_bloc.dart' as _i752;

_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.singleton<_i704.AppDatabase>(() => _i704.AppDatabase());
  gh.singleton<_i856.GameGenreRepository>(
    () => _i856.GameGenreRepository(gh<_i704.AppDatabase>()),
  );
  gh.factory<_i752.HomeBloc>(
    () => _i752.HomeBloc(gh<_i856.GameGenreRepository>()),
  );
  return getIt;
}
