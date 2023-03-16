import 'dart:convert';

import 'package:code_hero/error/error.dart';
import 'package:code_hero/external/authentication/authentication.dart';
import 'package:code_hero/model/hero.dart';
import 'package:code_hero/service/hero_service.dart';
import 'package:http/http.dart';

class MarvelHeroes implements HeroServices {
  static MarvelHeroes instance = MarvelHeroes();

  @override
  Future<List<Hero>> getMarvelHeroList(
      {int? limit, int? offset, String? name}) async {
    String queryParam = Authentication.instance.getAuthentication();
    String nameParam =
        (name != null && name.isNotEmpty) ? "&nameStartsWith=$name" : '';
    Response response = await get(
      Uri.parse(
          "http://gateway.marvel.com/v1/public/characters$queryParam&limit=$limit&offset=$offset$nameParam"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var list = json.decode(utf8.decode(response.bodyBytes))['data']['results'] !=
              null
          ? (json.decode(utf8.decode(response.bodyBytes))['data']['results'] as List)
              .map((e) => Hero.fromJson(e))
              .toList()
          : <Hero>[];

      return list;
    } else {
      throw ApiException();
    }
  }
}
