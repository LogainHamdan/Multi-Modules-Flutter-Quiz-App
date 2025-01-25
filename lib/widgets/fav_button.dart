import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/mcq.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.quizProvider,
  });

  final McqProvider quizProvider;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        side: const BorderSide(color: Colors.white),
      ),
      child: AnimatedScale(
        scale: quizProvider.favScal,
        duration: const Duration(milliseconds: 500),
        child: Icon(
          Icons.favorite,
          color: quizProvider.favColor,
        ),
      ),
    );
  }
}
