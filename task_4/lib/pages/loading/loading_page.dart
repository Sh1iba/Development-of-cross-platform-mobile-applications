import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/routes.dart';
import '../../theme/theme_toggle_action.dart'; // Добавляем импорт


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Color(0xFF032E6D) : Color(0xFF507ED1),
        foregroundColor: Colors.white,
        actions: [ThemeToggleAction()], // Добавляем переключатель
      ),
      backgroundColor: isDark ? Color(0xFF032E6D) : Color(0xFF507ED1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videogame_asset,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'GameLab',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'BungeeSpicer',
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}