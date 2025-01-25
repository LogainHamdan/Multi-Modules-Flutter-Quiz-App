import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/fields.dart'; // Assuming FieldProvider is in this file
import 'custom_textform_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fieldProvider = Provider.of<FieldProvider>(context);

    return Column(
      children: [
        CustomTextFormField(
          isPassword: false,
          controller: fieldProvider.emailLoginController,
          labelText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email address';
            }
            if (!fieldProvider.isValidEmail(value)) {
              return 'Enter a valid email address';
            }
            return null;
          },
        ),
        SizedBox(height: 15.h),
        CustomTextFormField(
          isPassword: true,
          controller: fieldProvider.passLoginController,
          labelText: 'Password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
