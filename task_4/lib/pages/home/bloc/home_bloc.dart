import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/game_genres_data.dart';
import '../../../models/game_genre.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadGameGenresEvent>(_onLoadGameGenres);
  }

  Future<void> _onLoadGameGenres(
      LoadGameGenresEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      emit(HomeLoaded(gameGenres));
    } catch (e) {
      emit(HomeError('Ошибка загрузки данных: $e'));
    }
  }
}
/*
• BLoC (бизнес-логика): компонент, принимающий на свой вход события для их последующей
обработки и генерации нового состояния. В своей работе использует потоки (Stream).
 */