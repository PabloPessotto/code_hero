import 'package:code_hero/external/api/marvel/marvel_heroes.dart';
import 'package:code_hero/model/hero.dart';
import 'package:code_hero/service/hero_service.dart';

class HeroesController implements HeroServices {
  static HeroesController instance = HeroesController();

  @override
  Future<List<Hero>> getMarvelHeroList(
      {int? limit, int? offset, String? name}) async {
    var heroList = await MarvelHeroes.instance
        .getMarvelHeroList(limit: limit, offset: offset, name: name);
    return heroList;
  }
}
