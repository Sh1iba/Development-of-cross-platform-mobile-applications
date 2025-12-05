import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes.dart';
import 'pages/loading/loading_page.dart';
import 'pages/login/login_page.dart';
import 'pages/register/register_page.dart';
import 'pages/home/bloc/home_bloc.dart';
import 'pages/home/home_page.dart';
import 'pages/detail/detail_page.dart';
import 'pages/profile/profile_page.dart';
import 'models/game_genre.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameLab',
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => BlocProvider(
          create: (context) => HomeBloc()..add(LoadGameGenresEvent()),
          child: const HomePage(),
        ),
        Routes.profile: (context) => ProfilePage(
          name: 'Зафар Иброгимов',
          email: 'zafar@mail.ru',
        ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Routes.detail) {
          final GameGenre genre = settings.arguments as GameGenre;
          return MaterialPageRoute(
            builder: (context) => DetailPage(genre: genre),
          );
        }
        return null;
      },
    );
  }
}