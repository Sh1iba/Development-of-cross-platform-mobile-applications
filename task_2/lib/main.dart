import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xE2053E8E),
                  Color(0xFF507ED1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.videogame_asset,
                  color: Colors.white,
                  size: 32
              ),
              SizedBox(width: 10),
              Text(
                'GameLab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier New',
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Text(
                  'Виды компьютерных игр',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A3A3A),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'Добро пожаловать в мир компьютерных игр! Здесь вы найдете классификацию '
                      'игровых жанров, которые покорили миллионы игроков по всему миру. '
                      'От захватывающих RPG до динамичных шутеров - каждая игра предлагает '
                      'уникальные впечатления.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF3A3A3A),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 220,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/game.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(Icons.sports_esports, size: 50, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Основные жанры:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A3A3A),
                            ),
                          ),

                          SizedBox(height: 10),

                          Text('1. RPG (Ролевые игры)'),
                          Text('2. Шутеры (FPS/TPS)'),
                          Text('3. Стратегии (RTS/TBS)'),
                          Text('4. Приключения (Adventure)'),
                          Text('5. Гонки (Racing)'),
                          Text('6. Симуляторы'),
                          Text('7. Спортивные игры'),
                          Text('8. Головоломки (Puzzle)'),
                          Text('9. Хорроры'),
                          Text('10. ММО (Многопользовательские)'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/ava.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Иброгимов Зафарбек Акбар угли',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3A3A3A),
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'ИКБО-35-22',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF3A3A3A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}