import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../core/util/constants.dart';
import '../providers/level.dart';
import '../widgets/my_level_widget.dart';
import '../widgets/my_outline_btn.dart';
import 'level_describtion.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final levelProvider = Provider.of<LevelProvider>(context);
    final mylevel = levelProvider.mylevel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MYOutlineBtn(
            icon: Icons.favorite,
            function: () {},
            bColor: kGreyFont.withOpacity(0.4),
            iconColor: kBlueIcon,
          ),
          SizedBox(
            width: 8.w,
          ),
          MYOutlineBtn(
            icon: Icons.person,
            function: () {},
            bColor: kGreyFont.withOpacity(0.4),
            iconColor: kBlueIcon,
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let\'s Play',
              style: TextStyle(
                fontSize: 32.sp,
                color: kRedFont,
                fontWeight: FontWeight.bold,
                fontFamily: kFontFamily,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Be the First!',
              style: TextStyle(
                fontSize: 18.sp,
                color: kGreyFont,
                fontFamily: kFontFamily,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: mylevel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyLevelWidget(
                      function: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LevelDescription(
                            level: mylevel[index],
                          );
                        }));
                      },
                      level: mylevel[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
