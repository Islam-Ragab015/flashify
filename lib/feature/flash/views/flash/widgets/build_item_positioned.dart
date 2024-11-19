
import 'package:flutter/material.dart';

class BuildItemPositioned extends StatelessWidget {
  const BuildItemPositioned({
    super.key,
    required this.positioned,
    required this.width,
    required this.image,
  });

  final double positioned;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: positioned,
      child: Image.asset(
        image,
        width: width,
      ),
    );
  }
}
