import 'package:Quiz/pages/multiple_q_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/level_Info.dart';
import '../widgets/my_outline_btn.dart';

class LevelDescription extends StatelessWidget {
  static const id = '/level';
  final Type level;
  const LevelDescription({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: level.colors,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.only(top: 56.h, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MYOutlineBtn(
                        icon: Icons.close,
                        function: () {
                          Navigator.pop(context);
                        },
                        bColor: Colors.white,
                        iconColor: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(level.image!),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level.subtitle!,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Sf-Pro-Text',
                        color: Colors.white60,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      level.title,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontFamily: 'Sf-Pro-Text',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      level.description!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Sf-Pro-Text',
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, level.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        'Play Now',
                        style: TextStyle(
                            // fontFamily: 'Sf-Pro-Text',
                            color: level.colors[0],
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.h,
                )
              ],
            )),
      ),
    );
  }
}
