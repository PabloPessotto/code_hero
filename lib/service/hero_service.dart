import 'package:code_hero/model/hero.dart';

abstract class HeroServices {
  Future<List<Hero>> getMarvelHeroList({int limit, int offset, String? name});
}
