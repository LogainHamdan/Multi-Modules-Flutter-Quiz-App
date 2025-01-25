import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';
import '../models/level_Info.dart';
import 'my_outline_btn.dart';

class MyLevelWidget extends StatelessWidget {
  final Function() function;
  final Type level;

  const MyLevelWidget({
    Key? key,
    required this.function,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 54.h, bottom: 24.h),
            padding: EdgeInsets.all(24.sp),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: level.colors,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: MYOutlineBtn(
                    icon: level.icon!,
                    iconColor: Colors.white,
                    bColor: Colors.white,
                    function: () {},
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  level.subtitle!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white60,
                    fontFamily: kFontFamily,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  level.title,
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 28.0.w),
            child: Image.asset(level.image!),
          ),
        ],
      ),
    );
  }
}
