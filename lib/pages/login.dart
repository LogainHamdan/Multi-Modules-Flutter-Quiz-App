import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import '../providers/login-state.dart';
import '../widgets/code-container.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/login-fields.dart';
import 'home.dart';
import 'join.dart';

class Login extends StatelessWidget {
  static const String id = '/login';
  final int selectedTab;

  const Login({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    final List<int> codeNums = [8, 5, 0, 4];

    return !loginState.isForgotton
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FieldProvider('Login')),
              ChangeNotifierProvider(create: (_) => ButtonProvider('Login')),
            ],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  LoginFormFields(),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      loginState.toggleForgotton(); // Toggle the state
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Consumer<FieldProvider>(
                    builder: (context, fieldProvider, _) {
                      return CustomElevatedButton(
                        onPressed: () {
                          if (fieldProvider.validateLoginForm()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login Successful'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushReplacementNamed(
                                context, HomePage.id);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please fill all fields correctly'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, JoinScreen.id),
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      )),
                ],
              ),
            ),
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => FieldProvider('Login')),
              ChangeNotifierProvider(create: (_) => ButtonProvider('Login'))
            ],
            child: Column(
              children: [
                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Put 4 Numbers sent to your email',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CodeContainer(num: codeNums[0]),
                    CodeContainer(num: codeNums[1]),
                    CodeContainer(num: codeNums[2]),
                    CodeContainer(num: codeNums[3]),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<FieldProvider>(
                  builder: (context, fieldProvider, _) {
                    return CustomElevatedButton(
                      onPressed: () {
                        if (fieldProvider.validateLoginForm()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Logged In Successful'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill all fields correctly'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          );
  }
}
