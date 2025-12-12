import 'package:flutter/material.dart';
import 'package:task_4/pages/detail/detail_page.dart';
import 'package:task_4/pages/home/home_page.dart';
import 'package:task_4/pages/loading/loading_page.dart';
import 'package:task_4/pages/login/login_page.dart';
import 'package:task_4/pages/profile/profile_page.dart';
import 'package:task_4/pages/register/register_page.dart';

import 'di/di.dart';
import 'core/routes.dart';
import 'data/models/game_genre.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameLab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => const HomePage(),
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