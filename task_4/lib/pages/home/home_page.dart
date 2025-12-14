import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di/di.dart';
import '../../../theme/theme_toggle_action.dart';
import '../profile/profile_page.dart';
import 'bloc/home_bloc.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(LoadGameGenresEvent()),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => __HomePageContentState();
}

class __HomePageContentState extends State<_HomePageContent> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    _buildSearchScreen(),
    _buildFavoritesScreen(),
    const ProfilePage(name: 'Зафар Иброгимов', email: 'zafar@mail.ru'),
  ];

  static Widget _buildSearchScreen() {
    return const Center(
      child: Text(
        'Функция поиска в разработке',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  static Widget _buildFavoritesScreen() {
    return const Center(
      child: Text(
        'Избранные игры будут отображаться здесь',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [Color(0xFF032E6D), Color(0xFF0A2A43)]
                  : [Color(0xE2053E8E), Color(0xFF507ED1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Добавляем пустой leading для симметрии с actions
        leading: Container(width: 30),
        // Абсолютно центрированный GameLab
        title: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.videogame_asset,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(width: 10),
              Text(
                'GameLab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BungeeSpicer',
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          ThemeToggleAction(),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        indicatorColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor?.withOpacity(0.2),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Поиск',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outlined),
            selectedIcon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}