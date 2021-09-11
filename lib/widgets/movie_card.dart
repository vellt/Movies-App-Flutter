import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_flutter/model/movie_preview.dart';
import 'package:movies_app_flutter/screens/details_screen.dart';
import 'package:movies_app_flutter/utils/star_calculator.dart'
    as starCalculator;
import 'package:sizer/sizer.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'custom_loading_spin_kit_ring.dart';
import 'package:movies_app_flutter/utils/navi.dart' as navi;

class MovieCard extends StatelessWidget {
  final MoviePreview moviePreview;
  final Color themeColor;
  final int? contentLoadedFromPage;

  MovieCard({
    required this.moviePreview,
    required this.themeColor,
    this.contentLoadedFromPage,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars =
        starCalculator.getStars(rating: moviePreview.rating, starSize: 2.h);

    return GestureDetector(
      onTap: () async {
        await navi.newScreen(
            context: context,
            newScreen: () => DetailsScreen(
                  id: moviePreview.id,
                  themeColor: themeColor,
                ));
        if (contentLoadedFromPage != null)
          kHomeScreenKey.currentState!.pageSwitcher(contentLoadedFromPage!);
      },
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.2.w),
                  child: CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Column(
                            children: [
                              Container(
                                height: 20.h,
                                child: CustomLoadingSpinKitRing(
                                    loadingColor: themeColor),
                              )
                            ],
                          ),
                      imageUrl: moviePreview.imageUrl!,
                      errorWidget: (context, url, error) => Column(
                            children: [
                              Container(
                                height: 20.h,
                                child: CustomLoadingSpinKitRing(
                                    loadingColor: themeColor),
                              )
                            ],
                          )),
                ),
              ),
              height: 30.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.w),
                      bottomRight: Radius.circular(5.w),
                    ),
                    color: kAppBarColor,
                    boxShadow: kBoxShadow,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  Text("${moviePreview.title} ",
                                      style: kBoldTitleTextStyle),
                                  Text(
                                      (moviePreview.year == "")
                                          ? ""
                                          : "(${moviePreview.year})",
                                      style: kTitleTextStyle),
                                ],
                              ),
                            ),
                            if (moviePreview.isFavorite)
                              Icon(
                                Icons.bookmark_sharp,
                                size: 15.sp,
                                color: kInactiveButtonColor,
                              ),
                          ],
                        ),
                        SizedBox(height: 1.5.w),
                        if (stars.length != 0) Row(children: stars),
                        SizedBox(height: 1.w),
                        Text(
                          moviePreview.overview,
                          style: kSubTitleCardBoxTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
