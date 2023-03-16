import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.onChanged}) : super(key: key);

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "BUSCA MARVEL",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Color(0xFFD42026),
                ),
              ),
              Text(
                "TESTE FRONT-END",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Color(0xFFD42026),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Nome do Personagem',
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFFD42026),
            ),
          ),
          TextField(
            onChanged: onChanged,
            cursorColor: const Color(0xFFD42026),
            style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.all(3),
              constraints: const BoxConstraints(maxHeight: 31),
            ),
          ),
        ],
      ),
    );
  }
}
