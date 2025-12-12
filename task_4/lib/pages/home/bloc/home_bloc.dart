import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../data/repositories/game_genre_repository.dart';
import '../../../data/models/game_genre.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GameGenreRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadGameGenresEvent>(_onLoadGameGenres);
    on<SearchGameGenresEvent>(_onSearchGameGenres);
  }

  Future<void> _onLoadGameGenres(
      LoadGameGenresEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());
    try {
      // Загрузка из БД через Repository
      final genres = await repository.getAllGenres();
      emit(HomeLoaded(gameGenres: genres, filteredGenres: genres));
    } catch (e) {
      emit(HomeError('Ошибка загрузки данных из БД: $e'));
    }
  }

  Future<void> _onSearchGameGenres(
      SearchGameGenresEvent event,
      Emitter<HomeState> emit,
      ) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      if (event.query.isEmpty) {
        emit(currentState.copyWith(filteredGenres: currentState.gameGenres));
      } else {
        // Поиск через Repository
        final filtered = await repository.searchGenres(event.query);
        emit(currentState.copyWith(filteredGenres: filtered));
      }
    }
  }
}