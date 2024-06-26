import 'package:cars_store/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:cars_store/features/home_feature/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_assets.dart';
import '../../../app/utils/helper.dart';
import '../../../app/widgets/image_widget.dart';
import '../../auth_feature/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      late Widget widget;
      if (FirebaseAuth.instance.currentUser?.uid==null) {
        widget = const LoginScreen();
      }else{
        widget = const BNBScreen();
      }
      navigateTo(widget,removeAll: true);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  ImageWidget(
          imageUrl: AppImages.appLogo,
          width: 200.w,
          height: 250.h,
        ),
      ),
    );
  }
}
