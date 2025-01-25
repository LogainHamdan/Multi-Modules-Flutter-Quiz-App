import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';

class CodeContainer extends StatelessWidget {
  final int num;

  const CodeContainer({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        child: Center(
          child: Text(
            '$num',
            style: TextStyle(
                fontSize: 30.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), // Rounded corners
          border: Border.all(
            color: Colors.deepOrange, // Orange border color
            width: 1.0.w, // Border width
          ),
        ),
        height: 100.sp,
        width: 50.sp,
      ),
    );
  }
}
