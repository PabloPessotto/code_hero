import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key? key, required this.label, this.isSelected = false, this.onTap})
      : super(key: key);
  final String label;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      radius: 32,
      child: Container(
        height: 32,
        width: 32,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: !isSelected ? Colors.white : const Color(0xFFD42026),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFD42026),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFD42026),
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
