import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/di.dart';
import 'core/routes.dart';
import 'data/models/game_genre.dart';
import 'pages/loading/loading_page.dart';
import 'pages/login/login_page.dart';
import 'pages/register/register_page.dart';
import 'pages/home/home_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/detail/detail_page.dart';
import 'theme/app_theme.dart';
import 'theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GameLab',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
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
        },
      ),
    );
  }
}