import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/game_genre.dart';
import 'bloc/home_bloc.dart';

import '../detail/detail_page.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 48),
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(LoadGameGenresEvent());
                  },
                  child: Text('Повторить'),
                ),
              ],
            ),
          );
        } else if (state is HomeLoaded) {
          return _buildContent(context, state.gameGenres);
        }

        // HomeInitial state
        return const Center(child: Text('Нажмите для загрузки данных'));
      },
    );
  }

  Widget _buildContent(BuildContext context, List<GameGenre> gameGenres) {
    final mediaQuery = MediaQuery.of(context);
    final bool isWideScreen = mediaQuery.size.width > 600;
    final double platformPadding = isWideScreen ? 50 : 20;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: platformPadding, left: 20.0, right: 20.0),
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
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
              padding: EdgeInsets.only(top: 5, left: 15, right: 15),
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
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: isWideScreen
                ? _buildGridView(gameGenres)
                : _buildListView(gameGenres),
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
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.person, color: Colors.grey[600]),
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
                        'Иброгимов Зафарбек Акбар угли',
                        style: TextStyle(
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
    );
  }

  Widget _buildListView(List<GameGenre> gameGenres) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: gameGenres.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(
              gameGenres[index].iconData,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(genre: gameGenres[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildGridView(List<GameGenre> gameGenres) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: gameGenres.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(genre: gameGenres[index]),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    gameGenres[index].iconData,
                    color: Color(0xFF507ED1),
                    size: 24,
                  ),
                  SizedBox(height: 8),
                  Text(
                    gameGenres[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3A3A3A),
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    gameGenres[index].description,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF3A3A3A),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage(String path) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: Icon(Icons.image, color: Colors.grey[600]),
            );
          },
        ),
      ),
    );
  }
}