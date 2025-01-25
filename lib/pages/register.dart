import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/custom_elevated_button.dart';
import '../providers/fields.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/register-fields.dart';
import 'home.dart';

class Register extends StatelessWidget {
  static const String id = '/register';
  final int selectedTab;

  const Register({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FieldProvider('')),
        ChangeNotifierProvider(
            create: (_) => ButtonProvider('Create an account')),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              RegisterFormFields(context: context),
              SizedBox(height: 20.h),
              Consumer<FieldProvider>(
                builder: (context, fieldProvider, _) {
                  return CustomElevatedButton(
                    onPressed: () {
                      if (fieldProvider.validateRegisterForm()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Signed Up Successful'),
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
        ),
      ),
    );
  }
}
