import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../core/util/constants.dart';
import '../models/mcq.dart';
import '../providers/mcq.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

class MultiQScreen extends StatelessWidget {
  static const id = '/questions';

  const MultiQScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<McqProvider>(context, listen: false);

    // Fetch data and start timer when the widget is built
    quizProvider.fetchMcqData().then((_) {
      quizProvider.startTimer(); // Start the timer after data is fetched
    });

    return Scaffold(
      body: Consumer<McqProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (quizProvider.mcq == null) {
            return const Center(child: Text('Failed to load data'));
          }

          final currentQuestion =
              quizProvider.mcq!.questions[quizProvider.currentQuestionIndex];

          // Calculate progress for the progress bar
          final progress = (quizProvider.currentQuestionIndex + 1) /
              quizProvider.mcq!.questions.length;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [kBlueBg, kL2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 56.h, left: 20.w, right: 20.w, bottom: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MYOutlineBtn(
                        icon: Icons.close,
                        iconColor: Colors.white,
                        bColor: Colors.white,
                        function: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );
                          quizProvider.resetQuiz();
                        },
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 56.h,
                            width: 56.w,
                            child: CircularProgressIndicator(
                              value: quizProvider.counter / 10,
                              color: quizProvider.counter > 5
                                  ? Colors.white
                                  : Colors.redAccent,
                              backgroundColor: Colors.white12,
                            ),
                          ),
                          Text(
                            quizProvider.counter.toString(),
                            style: TextStyle(
                              fontFamily: 'Sf-Pro-Text',
                              fontSize: 24.sp,
                              color: quizProvider.counter > 5
                                  ? Colors.white
                                  : Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Image.asset(
                      'assets/images/ballon-b.png',
                      height: 170.h,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Question ${quizProvider.currentQuestionIndex + 1} of ${quizProvider.mcq!.questions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Sf-Pro-Text',
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Add the progress bar here
                  LinearProgressIndicator(
                    value: progress, // Progress value (0.0 to 1.0)
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 4.h, // Height of the progress bar
                  ),
                  SizedBox(height: 8.h),
                  AutoSizeText(
                    maxLines: 4,
                    currentQuestion.description,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'Sf-Pro-Text',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: currentQuestion.options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = currentQuestion.options[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: GestureDetector(
                            onTap: quizProvider.counterFinished
                                ? null
                                : quizProvider.userChoice == null
                                    ? () {
                                        quizProvider.checkAnswer(
                                            index, context);
                                      }
                                    : null,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(16.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                gradient: LinearGradient(
                                  colors: quizProvider.userChoice != null
                                      ? (quizProvider.isCorrect! &&
                                              quizProvider.userChoice == index)
                                          ? [ky1, ky2]
                                          : quizProvider.userChoice == index
                                              ? [kr1, kr2]
                                              : quizProvider
                                                          .showCorrectAnswer &&
                                                      option.isCorrect
                                                  ? [ky1, ky2]
                                                  : [
                                                      Colors.white54,
                                                      Colors.white54
                                                    ]
                                      : quizProvider.showCorrectAnswer &&
                                              option.isCorrect
                                          ? [ky1, ky2]
                                          : [Colors.white, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 24.w),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        option.description,
                                        style: TextStyle(
                                          color: quizProvider.userChoice != null
                                              ? quizProvider.userChoice == index
                                                  ? Colors.white
                                                  : kL2
                                              : kL2,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    quizProvider.userChoice == null
                                        ? null
                                        : quizProvider.isCorrect! &&
                                                quizProvider.userChoice == index
                                            ? Icons.check
                                            : quizProvider.userChoice == index
                                                ? Icons.close
                                                : null,
                                    color: quizProvider.userChoice != null
                                        ? quizProvider.userChoice == index
                                            ? Colors.white
                                            : null
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Wrap(
                    children: quizProvider.scoreKeeper,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Show Answer Text with GestureDetector
                      GestureDetector(
                        onTap: ((quizProvider.userChoice == null &&
                                    quizProvider.counter == 0) ||
                                (quizProvider.userChoice != null &&
                                    !quizProvider.isCorrect!))
                            ? () {
                                quizProvider.showAnswer(context);
                              }
                            : null, // Disable gesture when not applicable
                        child: Text(
                          ((quizProvider.userChoice == null &&
                                      quizProvider.counter == 0) ||
                                  (quizProvider.userChoice != null &&
                                      !quizProvider.isCorrect!))
                              ? 'Show Answer'
                              : '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                    2.0, 2.0), // Horizontal and vertical offset
                                blurRadius: 3.0.r, // Blur radius
                                color: Colors.black.withOpacity(
                                    0.5), // Shadow color with opacity
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Next/Show Result Text with GestureDetector
                      GestureDetector(
                        onTap: quizProvider.userChoice != null ||
                                (quizProvider.userChoice == null &&
                                    quizProvider.counter == 0)
                            ? () {
                                quizProvider.nextQuestion(context);
                              }
                            : null, // Disable gesture when not applicable
                        child: Text(
                          (quizProvider.userChoice != null ||
                                  (quizProvider.userChoice == null &&
                                      quizProvider.counter == 0))
                              ? (quizProvider.userChoice == null &&
                                          quizProvider.counter == 0 &&
                                          quizProvider.mcq!.questions.length ==
                                              quizProvider
                                                      .currentQuestionIndex +
                                                  1 ||
                                      (quizProvider.userChoice != null &&
                                          quizProvider.mcq!.questions.length ==
                                              quizProvider
                                                      .currentQuestionIndex +
                                                  1))
                                  ? 'Show Result'
                                  : 'Next'
                              : '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                    2.0, 2.0), // Horizontal and vertical offset
                                blurRadius: 3.0.r, // Blur radius
                                color: Colors.black.withOpacity(
                                    0.5), // Shadow color with opacity
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
