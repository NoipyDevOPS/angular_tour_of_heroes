import 'hero.dart';
import 'mock_heroes.dart';
import 'dart:async';
import 'route_paths.dart';

class HeroService{
  Future<Hero> get(int id) async =>
    (await getAll()).firstWhere((hero) => hero.id == id);
}