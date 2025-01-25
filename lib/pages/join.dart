import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import 'login.dart';
import 'register.dart';

class JoinScreen extends StatefulWidget {
  static const String id = '/join';

  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> selectedTab = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
    // Initialize TabController with initialIndex set to 0 (Sign Up)
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      selectedTab.value = _tabController.index; // Update ValueNotifier
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    selectedTab.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360.w, 690.h));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return ScreenUtilInit(
      enableScaleText: () => false,
      enableScaleWH: () => false,
      child: Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: selectedTab,
          builder: (context, currentTab, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  currentTab == 0
                      ? Center(
                          child: Transform.scale(
                            scale: 1.0, // Scale to 100% for the second case
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 12.0.h, bottom: 30.h),
                              child: SizedBox(
                                height:
                                    300.h, // Even larger height for the 'img'
                                width: 300.w, // Even larger width for the 'img'
                                child: Image(
                                  image: AssetImage('assets/images/img.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Transform.scale(
                            scale: 0.5, // Scale down to 50% for the first case
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 8.0.h,
                              ),
                              child: SizedBox(
                                height: 180.h, // Larger height for the 'img'
                                width: 180.w, // Larger width for the 'img'
                                child: Image(
                                  image: AssetImage('assets/images/img.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                  currentTab != 0
                      ? AnimatedContainer(
                          height: 800.h,
                          duration: Duration(seconds: 5),
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                height: 200.h,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  gradient: LinearGradient(
                                      colors: [kBlueBg, kBlueIcon]),
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              AnimatedContainer(
                                margin: EdgeInsets.only(top: 75.sp),
                                height: 800.sp,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  color: Colors.white,
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              TabBar(
                                dividerHeight: 0,
                                padding: EdgeInsets.all(8.sp),
                                controller: _tabController,
                                indicator: BoxDecoration(),
                                labelColor: Colors.white,
                                unselectedLabelColor:
                                    Colors.white70.withOpacity(0.5),
                                labelStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                unselectedLabelStyle: TextStyle(
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                tabs: const <Widget>[
                                  Tab(text: "Login"),
                                  Tab(text: "Sign Up"),
                                ],
                              ),
                              Positioned(
                                top: 100.sp,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Login(selectedTab: currentTab),
                                    Register(selectedTab: currentTab),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                height: 500.h,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(35.r),
                                      topLeft: Radius.circular(35.r),
                                    ),
                                    gradient: LinearGradient(
                                        colors: [kBlueBg, kBlueIcon])),
                                duration: const Duration(seconds: 5),
                              ),
                              AnimatedContainer(
                                height: 500.h,
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.only(top: 70.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  color: Colors.white,
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: TabBar(
                                  dividerHeight: 0,
                                  controller: _tabController,
                                  indicator: BoxDecoration(),
                                  labelColor: Colors.white,
                                  unselectedLabelColor:
                                      Colors.white70.withOpacity(0.5),
                                  labelStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                    fontSize: 20.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const <Widget>[
                                    Tab(text: "Login"),
                                    Tab(text: "Sign Up"),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 100.sp,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Login(selectedTab: currentTab),
                                    Register(selectedTab: currentTab),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
