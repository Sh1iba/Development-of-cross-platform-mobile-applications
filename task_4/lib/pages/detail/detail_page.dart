import 'package:flutter/material.dart';
import '../../models/game_genre.dart';

class DetailPage extends StatelessWidget {
  final GameGenre genre;

  const DetailPage({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genre.title),
        backgroundColor: Color(0xFF507ED1),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(genre.iconData, size: 40, color: Color(0xFF507ED1)),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    genre.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
              ),
            ),
            SizedBox(height: 10),
            Text(
              genre.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Популярные игры:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildGameItem('The Witcher 3: Wild Hunt', 'CD Projekt Red'),
                  _buildGameItem('Cyberpunk 2077', 'CD Projekt Red'),
                  _buildGameItem('Mass Effect Legendary Edition', 'BioWare'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameItem(String title, String developer) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(Icons.sports_esports, color: Color(0xFF507ED1)),
        title: Text(title),
        subtitle: Text(developer),
      ),
    );
  }
}