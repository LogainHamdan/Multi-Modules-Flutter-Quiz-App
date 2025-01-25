import 'package:Quiz/pages/join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import 'home.dart';

class LaunchScreen extends StatelessWidget {
  static const id = '/splash';
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kBlueBg,
              kL2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const Opacity(
                opacity: 0.8,
                child: Image(
                  image: AssetImage('assets/images/cloud.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(60.0.sp),
                      child: Image(
                        image: AssetImage('assets/images/img.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        backgroundColor: ky1,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 80.w,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, JoinScreen.id);
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
