import 'package:flutter/material.dart';
import '../../data/models/game_genre.dart';

class DetailPage extends StatelessWidget {
  final GameGenre genre;

  const DetailPage({super.key, required this.genre});

  void _goBack(BuildContext context) {
    Navigator.pop(context);
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => _goBack(context),
        ),
        // Используем Stack для абсолютного центрирования
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
        // Добавляем пустой контейнер справа для симметрии
        actions: [
          Container(width: 48), // Такая же ширина как у leading
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  genre.iconData,
                  size: 40,
                  color: isDark ? Color(0xFF64B5F6) : Color(0xFF507ED1),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    genre.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Color(0xFF3A3A3A),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Описание:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Color(0xFF3A3A3A),
              ),
            ),
            SizedBox(height: 10),
            Text(
              genre.description,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey.shade300 : Color(0xFF3A3A3A),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Популярные игры:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Color(0xFF3A3A3A),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildGameItem('The Witcher 3: Wild Hunt', 'CD Projekt Red', isDark),
                  _buildGameItem('Cyberpunk 2077', 'CD Projekt Red', isDark),
                  _buildGameItem('Mass Effect Legendary Edition', 'BioWare', isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameItem(String title, String developer, bool isDark) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      color: isDark ? Color(0xFF1E1E1E) : Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.sports_esports,
          color: isDark ? Color(0xFF64B5F6) : Color(0xFF507ED1),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Color(0xFF3A3A3A),
          ),
        ),
        subtitle: Text(
          developer,
          style: TextStyle(
            color: isDark ? Colors.grey.shade400 : Color(0xFF3A3A3A),
          ),
        ),
      ),
    );
  }
}