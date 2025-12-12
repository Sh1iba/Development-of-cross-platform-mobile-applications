part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class LoadGameGenresEvent extends HomeEvent {}

final class SearchGameGenresEvent extends HomeEvent {
  final String query;
  SearchGameGenresEvent(this.query);
}

/*
• Events (События): это входные данные или действия, которые происходят в приложении. Они
могут быть инициированы пользователем – пользовательские события (например, нажатие кнопки,
отправка формы, ввод текста, пролистывание экрана) или системой – системные события (например,
получение данных из сети, сработал таймер, пришло push-уведомление, изменилась ориентация экрана,
потеря Интернет-соединения).
 */