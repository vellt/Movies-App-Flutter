import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/file_manager.dart' as file;
import 'package:movies_app_flutter/utils/scroll_top_with_controller.dart'
    as scrollTop;
import 'package:movies_app_flutter/services/movie.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/widgets/custom_loading_spin_kit_ring.dart';
import 'package:movies_app_flutter/widgets/movie_card.dart';
import 'package:movies_app_flutter/widgets/movie_card_container.dart';
import 'package:movies_app_flutter/widgets/shadowless_floating_button.dart';
import 'package:sizer/sizer.dart';

class GenreWiseScreen extends StatefulWidget {
  final String genre;
  final int genreId;
  GenreWiseScreen({Key? key, required this.genre, required this.genreId})
      : super(key: key);

  @override
  State<GenreWiseScreen> createState() => _GenreWiseScreenState();
}

class _GenreWiseScreenState extends State<GenreWiseScreen>
    with TickerProviderStateMixin {
  Color? themeColor;
  List<MovieCard>? _movieCards;
  bool showBackToTopButton = false;
  ScrollController? _scrollController;
  Future<void> loadData() async {
    MovieModel movieModel = MovieModel();
    _movieCards = await movieModel.getGenreWiseMovies(
        genreId: widget.genreId, themeColor: themeColor!);

    setState(() {
      scrollTop.scrollToTop(_scrollController!);
      showBackToTopButton = false;
    });
  }

  @override
  void initState() {
    super.initState();
    () async {
      themeColor = await file.currentTheme();
      print(themeColor);
      _scrollController = ScrollController()
        ..addListener(() {
          setState(() {
            showBackToTopButton = (_scrollController!.offset >= 200);
          });
        });
      setState(() {
        loadData();
      });
    }();
  }

  @override
  void dispose() {
    if (_scrollController != null) _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre, style: kSmallAppBarTitleTextStyle),
        backgroundColor: kSearchAppBarColor,
        shadowColor: Colors.transparent,
      ),
      body: (_movieCards == null)
          ? CustomLoadingSpinKitRing(loadingColor: themeColor)
          : (_movieCards!.length == 0)
              ? Center(child: Text(k404Text))
              : MovieCardContainer(
                  scrollController: _scrollController!,
                  themeColor: themeColor!,
                  movieCards: _movieCards!,
                ),
      floatingActionButton: showBackToTopButton
          ? ShadowlessFloatingButton(
              iconData: Icons.keyboard_arrow_up_outlined,
              onPressed: () {
                setState(() {
                  scrollTop.scrollToTop(_scrollController!);
                });
              },
              backgroundColor: themeColor,
            )
          : null,
    );
  }
}
