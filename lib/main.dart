import 'package:Quiz/providers/TF.dart';
import 'package:Quiz/providers/custom_elevated_button.dart';
import 'package:Quiz/providers/fields.dart';
import 'package:Quiz/providers/level.dart';
import 'package:Quiz/providers/login-state.dart';
import 'package:Quiz/providers/mcq.dart';
import 'package:Quiz/providers/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'my_material_app.dart';

////

void main() {
  // Initialize the notification handler
  runApp(MyApp()); // Pass plugin to the app
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (_) => LevelProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => McqProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TrueFalseQuizProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TextFieldProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FieldProvider(''),
          ),
          ChangeNotifierProvider(
            create: (_) => ButtonProvider(''),
          ),
          ChangeNotifierProvider(
            create: (_) => LoginState(),
          ),
        ], child: MyMaterialApp());
      },
    );
  }
}
