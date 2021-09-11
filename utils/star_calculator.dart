import 'package:flutter/material.dart';
import 'package:movies_app_flutter/widgets/star_icon.dart';

List<Widget> getStars({required double? rating, required double starSize}) {
  List<StarIcon> temp = [];
  if (rating != null) {
    for (var i = 0; i < rating ~/ 2; i++) {
      //(rating/2).toInt() == rating ~/ 2
      temp.add(StarIcon(
        icon: Icons.star,
        size: starSize,
      ));
    }
    if (rating > 0 && rating % 2 != 0)
      temp.add(StarIcon(
        icon: Icons.star_half,
        size: starSize,
      ));
    while (temp.length < 5) {
      temp.add(StarIcon(
        icon: Icons.star_border,
        size: starSize,
      ));
    }
  }
  return temp;
}
