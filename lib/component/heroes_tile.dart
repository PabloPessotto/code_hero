import 'package:code_hero/model/hero.dart' as h;
import 'package:code_hero/pages/details/heroes_details.dart';
import 'package:flutter/material.dart';

class HeroesTile extends StatelessWidget {
  final h.Hero hero;
  const HeroesTile({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        hero.name ?? '',
        style: const TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
      ),
      minLeadingWidth: 25,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            hero.thumbnail!,
            width: 58,
            height: 58,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HeroesDetails(hero: hero),
          ),
        );
      },
    );
  }
}
