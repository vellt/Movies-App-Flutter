import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/widgets/custom_movies_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieDetails {
  final int id;
  final String title;
  final String year;
  final bool isFavorite;
  final double rating;
  final List<String> genres;
  final String overview;
  final String backgroundURL;

  MovieDetails({
    required this.id,
    required this.title,
    required this.year,
    required this.isFavorite,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.backgroundURL,
  });

  List<CustomMoviesButton> getGenresList() {
    List<CustomMoviesButton> temp = [];
    for (var item in genres) {
      temp.add(
        CustomMoviesButton(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          color: kLightGrey,
          text: item,
        ),
      );
    }
    return temp;
  }
}
