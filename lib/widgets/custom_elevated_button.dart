import 'package:Quiz/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/custom_elevated_button.dart';
import '../providers/text_field.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TextFieldProvider>(context);
    final buttonProvider = Provider.of<ButtonProvider>(context);

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(300.w, 50.h)),
        elevation: MaterialStateProperty.all(10.h),
        backgroundColor: MaterialStateProperty.all(
          kBlueBg,
        ),
        shadowColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
      onPressed: provider.error == null ? onPressed : null,
      child: Text(
        buttonProvider.buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
