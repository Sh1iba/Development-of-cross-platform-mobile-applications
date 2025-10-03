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
                  fontFamily: 'BungeeSpicer',
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
                padding: EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
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


              Container(
                height: 220,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, left: 15,right: 15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildImage("assets/images/1.png"),
                      _buildImage("assets/images/3.png"),
                      _buildImage("assets/images/4.png"),
                      _buildImage("assets/images/5.png"),
                      _buildImage("assets/images/2.png"),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 20, left: 20,right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: gameGenres.length,
                  itemBuilder: (context, index) {
                    return Card(
                      //высота тени карточки
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        //ListTile — это готовый виджет Flutter для отображения одной строки списка с типичной структурой:
                        // • иконка/аватарка слева,
                        // • заголовок,
                        // • подзаголовок,
                        // • иконка/кнопка справа
                        leading: Icon(
                          gameGenres[index].icon,
                          color: Color(0xFF507ED1),
                          size: 28,
                        ),

                        title: Text(
                          gameGenres[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3A3A3A),
                          ),
                        ),

                        subtitle: Text(
                          gameGenres[index].description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF3A3A3A),
                          ),
                        ),

                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        ),

                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Выбран жанр: ${gameGenres[index].title}'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xFF507ED1),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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

Widget _buildImage(String path) {
  return Container(
    width: 140,
    margin: EdgeInsets.symmetric(horizontal:5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    ),
  );
}

class GameGenre {
  final String title;
  final String description;
  final IconData icon;

  GameGenre({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<GameGenre> gameGenres = [
  GameGenre(
    title: 'RPG (Ролевые игры)',
    description: 'Погружение в роль персонажа, развитие навыков и сюжет',
    icon: Icons.people,
  ),
  GameGenre(
    title: 'Шутеры (FPS/TPS)',
    description: 'Динамичные сражения от первого или третьего лица',
    icon: Icons.games,
  ),
  GameGenre(
    title: 'Стратегии (RTS/TBS)',
    description: 'Тактическое планирование и управление ресурсами',
    icon: Icons.map,
  ),
  GameGenre(
    title: 'Приключения (Adventure)',
    description: 'Исследование мира и решение загадок',
    icon: Icons.explore,
  ),
  GameGenre(
    title: 'Гонки (Racing)',
    description: 'Соревнования на скорость и мастерство вождения',
    icon: Icons.directions_car,
  ),
  GameGenre(
    title: 'Симуляторы',
    description: 'Реалистичное воспроизведение различных процессов',
    icon: Icons.flight,
  ),
  GameGenre(
    title: 'Спортивные игры',
    description: 'Виртуальные соревнования в различных видах спорта',
    icon: Icons.sports_soccer,
  ),
  GameGenre(
    title: 'Головоломки (Puzzle)',
    description: 'Логические задачи и испытания для ума',
    icon: Icons.psychology,
  ),
  GameGenre(
    title: 'Хорроры',
    description: 'Напряженная атмосфера и элементы ужасов',
    icon: Icons.nightlight_round,
  ),
  GameGenre(
    title: 'ММО (Многопользовательские)',
    description: 'Массовые онлайн-миры с тысячами игроков',
    icon: Icons.language,
  ),
];