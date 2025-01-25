import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String? errorText; // New field for error text

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.isPassword,
    this.errorText, // Initialize errorText
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      validator: widget.validator,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.deepOrange,
                ),
              )
            : null,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        errorText: widget.errorText, // Display error text when present
      ),
    );
  }
}
