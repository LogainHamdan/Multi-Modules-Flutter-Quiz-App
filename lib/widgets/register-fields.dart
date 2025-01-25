import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/fields.dart'; // Assuming FieldProvider is in this file
import 'custom_textform_field.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final fieldProvider = Provider.of<FieldProvider>(context);

    return Column(
      children: [
        CustomTextFormField(
          controller: fieldProvider.firstNameController,
          labelText: 'First Name',
          errorText: fieldProvider.firstNameError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your first name';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(height: 15.h),
        CustomTextFormField(
          controller: fieldProvider.surnameController,
          labelText: 'Surname',
          errorText: fieldProvider.surnameError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your surname';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(height: 15.h),
        CustomTextFormField(
          controller: fieldProvider.userNameController,
          labelText: 'Username',

          errorText: fieldProvider.userNameError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your username';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(height: 15.h),
        CustomTextFormField(
          controller: fieldProvider.emailRegController,
          labelText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          errorText: fieldProvider.emailRegError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email address';
            }
            if (!fieldProvider.isValidEmail(value)) {
              return 'Enter a valid email address';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: fieldProvider.numberController,
          labelText: 'Phone Number',
          errorText: fieldProvider.numberError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your phone number';
            }
            return null;
          },
          isPassword: false,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: fieldProvider.passRegController,
          labelText: 'Password',
          errorText: fieldProvider.passRegError, // Display error mes
          // sage
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your password';
            }
            return null;
          },
          isPassword: true,
        ),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: fieldProvider.confPassController,
          labelText: 'Confirm Password',
          errorText: fieldProvider.confPassError, // Display error message
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm your password';
            }
            if (value != fieldProvider.passRegController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          isPassword: true,
        ),
      ],
    );
  }
}
