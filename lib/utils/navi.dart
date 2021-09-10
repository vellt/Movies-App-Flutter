import 'package:flutter/material.dart';

Future newScreen(
    {required Function newScreen, required BuildContext context}) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newScreen()),
  );
}
