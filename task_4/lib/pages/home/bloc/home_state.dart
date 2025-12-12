part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<GameGenre> gameGenres;
  final List<GameGenre> filteredGenres;

  HomeLoaded({
    required this.gameGenres,
    required this.filteredGenres,
  });

  HomeLoaded copyWith({
    List<GameGenre>? gameGenres,
    List<GameGenre>? filteredGenres,
  }) {
    return HomeLoaded(
      gameGenres: gameGenres ?? this.gameGenres,
      filteredGenres: filteredGenres ?? this.filteredGenres,
    );
  }
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