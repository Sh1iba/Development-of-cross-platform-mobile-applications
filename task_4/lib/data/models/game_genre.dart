import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameGenre {
  final int? id;
  final String title;
  final String description;
  final String iconCode;

  GameGenre({
    this.id,
    required this.title,
    required this.description,
    required this.iconCode,
  });

  factory GameGenre.fromMap(Map<String, dynamic> map) {
    return GameGenre(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      iconCode: map['iconCode'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconCode': iconCode,
    };
  }

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