
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameGenre {
  final String title;
  final String description;
  final String iconCode;

  GameGenre({
    required this.title,
    required this.description,
    required this.iconCode,
  });


  IconData get iconData => _getIconData(iconCode);

  static IconData _getIconData(String code) {
    switch (code) {
      case 'people': return Icons.people;
      case 'games': return Icons.games;
      case 'map': return Icons.map;
      case 'explore': return Icons.explore;
      case 'directions_car': return Icons.directions_car;
      case 'flight': return Icons.flight;
      case 'sports_soccer': return Icons.sports_soccer;
      case 'psychology': return Icons.psychology;
      case 'nightlight_round': return Icons.nightlight_round;
      case 'language': return Icons.language;
      default: return Icons.category;
    }
  }
}