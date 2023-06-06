import 'package:flutter/material.dart';

double? width;
double? height;

class MediaQuery extends StatelessWidget {
  const MediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context)?.size.width;
    height = MediaQuery.of(context)?.size.height;
    return Container();
  }

  static of(BuildContext context) {}
}
