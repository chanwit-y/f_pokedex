import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ExString on String {
  Color toTypeColor() {
    switch (this) {
      case "grass": return Colors.green;
      case "fire": return Colors.red;
      case "water": return Colors.blue;
      case "bug": return Colors.lime.shade500;
      case "psychic": return Colors.purple;
      case "electric": return Colors.yellow.shade600;
      case "rock": return Colors.brown;
      case "poison": return Colors.purple.shade300;
      case "ground": return Colors.brown.shade400;
      case "ice": return Colors.blue.shade300;
      case "ghost": return Colors.purple.shade800;
      case "dark": return Colors.black;
      default:
        return Colors.grey;
    }
  }

  String toUpperCaseFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  Widget toSvg(double height, double width) {
    return SvgPicture.network(
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${this}.svg',
      height: height,
      width: width,
    );
  }
}
