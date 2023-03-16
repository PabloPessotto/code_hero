import 'package:code_hero/component/circular_button.dart';
import 'package:code_hero/component/heroes_tile.dart';
import 'package:code_hero/component/search_bar.dart';
import 'package:code_hero/controller/heroes_controller.dart';
import 'package:code_hero/util/debouncer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int _limit = 4;
  int _offset = 0;
  int _currentPage = 0;
  final List<int> _offsets = [0, 4, 8];
  String _name = '';

  void _selectPage(int page) {
    setState(() => _currentPage = page);
    _offset = _offsets[page];
  }

  void nextPage() {
    _currentPage = (_currentPage + 1) % _offsets.length;
    _selectPage(_currentPage);
  }

  void returnPage() {
    _currentPage = (_currentPage - 1 + _offsets.length) % _offsets.length;
    _selectPage(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              onChanged: (search) {
                Debouncer.instance.run(() {
                  setState(() => _name = search);
                });
              },
            ),
            Container(
              width: double.maxFinite,
              height: 37.0,
              color: const Color(0xFFD42026),
              child: const Center(
                child: Text(
                  "Nome",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: HeroesController.instance
                    .getMarvelHeroList(limit: _limit, offset: _offset, name: _name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Scrollbar(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == 0) const Divider(),
                            HeroesTile(hero: snapshot.data![index]),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: returnPage,
                  icon: const Icon(Icons.arrow_left),
                  iconSize: 42,
                  splashRadius: 1,
                  color: const Color(0xFFD42026),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => CircularButton(
                      label: '${index + 1}',
                      isSelected: index == _currentPage,
                      onTap: () {
                        _selectPage(index);
                      },
                    ),
                  ).toList(),
                ),
                IconButton(
                  onPressed: nextPage,
                  icon: const Icon(Icons.arrow_right),
                  iconSize: 42,
                  splashRadius: 1,
                  color: const Color(0xFFD42026),
                ),
              ],
            ),
            Container(
              color: const Color(0xFFD42026),
              width: double.maxFinite,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
