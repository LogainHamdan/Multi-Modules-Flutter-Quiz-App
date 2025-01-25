import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import '../providers/mcq.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.quizProvider,
    required this.context,
  });

  final McqProvider quizProvider;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontFamily: kFontFamily),
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
        foregroundColor: Colors.white,
        side: BorderSide.none,
      ),
      onPressed:
          ((quizProvider.userChoice == null && quizProvider.counter == 0) ||
                  (quizProvider.userChoice != null && !quizProvider.isCorrect!))
              ? () {
                  quizProvider.showAnswer(context);
                }
              : null,
      child: Text(
        ((quizProvider.userChoice == null && quizProvider.counter == 0) ||
                (quizProvider.userChoice != null && !quizProvider.isCorrect!))
            ? 'Show Answer'
            : '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
