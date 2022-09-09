import 'package:movies_app_flutter/screens/genre_wise_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/widgets/custom_movies_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/navi.dart' as navi;

class MovieDetails {
  final String title;
  final String year;
  final bool isFavorite;
  final double rating;
  final Map<String, int> genres;

  final String overview;
  final String backgroundURL;

  MovieDetails({
  
    required this.title,
    required this.year,
    required this.isFavorite,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.backgroundURL,
  });

  List<CustomMoviesButton> getGenresList(BuildContext context) {
    List<CustomMoviesButton> temp = [];
    genres.forEach((genre, genreId) {
      temp.add(
        CustomMoviesButton(
          onPressed: (() => navi.newScreen(
              newScreen: () => GenreWiseScreen(
                    genre: genre,
                    genreId: genreId,
                  ),
              context: context)),
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          color: kLightGrey,
          text: genre,
        ),
      );
    });
  
    return temp;
  }
}
