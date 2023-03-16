import 'package:code_hero/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HeroCode());
}

class HeroCode extends StatelessWidget {
  const HeroCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFD42026),
        primarySwatch: buildMaterialColor(const Color(0xFFD42026)),
        dividerColor: const Color(0xFFD42026),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w900,
              fontSize: 21,
            ),
            iconTheme: IconThemeData(
              color: Color(0xFFD42026),
            )),
      ),
      home: const Home(),
    );
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
