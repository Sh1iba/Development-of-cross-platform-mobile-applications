part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<GameGenre> gameGenres;

  HomeLoaded(this.gameGenres);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

/*
• State (Состояние): текущее состояние всего графического пользовательского интерфейса
приложения или его части, которое меняется в ответ на события (ошибка, ожидание получения данных и
т.д.);
 */