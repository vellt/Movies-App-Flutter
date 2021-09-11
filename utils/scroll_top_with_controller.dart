import 'package:flutter/material.dart';

void scrollToTop(ScrollController scrollController) {
  if (scrollController.hasClients)
    scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInBack,
    );
}
