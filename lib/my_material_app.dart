import 'package:Quiz/pages/home.dart';
import 'package:Quiz/pages/join.dart';
import 'package:Quiz/pages/launch_screen.dart';
import 'package:Quiz/pages/level_describtion.dart';
import 'package:Quiz/pages/login.dart';
import 'package:Quiz/pages/multiple_q_screen.dart';
import 'package:Quiz/pages/register.dart';
import 'package:Quiz/pages/true_false_q_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/util/constants.dart';
import 'models/level_Info.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Your design's screen size
      minTextAdapt: true,
      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz App',
          theme: ThemeData(
            fontFamily: kFontFamily,
            iconTheme: const IconThemeData(color: Color(0xffB2B2B2)),
            textTheme: TextTheme(
              bodySmall: TextStyle(
                  color: const Color(0xffB2B2B2),
                  fontSize: 12.sp,
                  fontFamily: kFontFamily),
              bodyMedium: TextStyle(
                fontFamily: kFontFamily,
                color: const Color(0xff272727),
                fontSize: 18.sp,
              ),
            ),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF7F6FF)),
            scaffoldBackgroundColor: const Color(0xffF7F6FF),
            colorScheme: ColorScheme.fromSeed(seedColor: kBlueIcon),
          ),
          initialRoute: LaunchScreen.id,
          routes: {
            HomePage.id: (context) => HomePage(),
            TrueFalseQuiz.id: (context) => TrueFalseQuiz(),
            LaunchScreen.id: (context) => LaunchScreen(),
            MultiQScreen.id: (context) => MultiQScreen(),
            Register.id: (context) => Register(
                  selectedTab: 1,
                ),
            Login.id: (context) => Login(
                  selectedTab: 1,
                ),
            JoinScreen.id: (context) => JoinScreen(),
            LevelDescription.id: (context) => LevelDescription(
                  level: Type(
                      title: 'title',
                      subtitle: 'subtitle',
                      colors: [],
                      routeName: LevelDescription.id),
                ),
          },
        );
      },
    );
  }
}
