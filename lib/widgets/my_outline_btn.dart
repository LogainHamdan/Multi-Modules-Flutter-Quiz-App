import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MYOutlineBtn extends StatelessWidget {
  final IconData icon;
  final Color bColor;
  final Color iconColor;
  final OutlinedBorder shapeBorder;
  final Function() function;
  const MYOutlineBtn({
    Key? key,
    required this.icon,
    required this.function,
    required this.bColor,
    required this.iconColor,
    this.shapeBorder = const CircleBorder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 44.w,
      child: OutlinedButton(
        onPressed: function,
        child: Icon(
          icon,
          color: iconColor,
        ),
        style: ButtonStyle().copyWith(
            shape: MaterialStatePropertyAll(
              shapeBorder,
            ),
            side: MaterialStatePropertyAll(
              BorderSide(color: bColor),
            ),
            padding: MaterialStatePropertyAll(EdgeInsets.all(8.sp))),
      ),
    );
  }
}
