import 'package:code_hero/model/hero.dart' as h;
import 'package:flutter/material.dart';

class HeroesDetails extends StatelessWidget {
  const HeroesDetails({Key? key, required this.hero}) : super(key: key);
  final h.Hero hero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "SOBRE",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(hero.thumbnail!, height: 230),
                      ),
                    ),
                    Text(
                      "${hero.name}",
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.maxFinite,
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Descrição",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            hero.description!.isEmpty
                                ? "Sem Descrição"
                                : hero.description!,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
