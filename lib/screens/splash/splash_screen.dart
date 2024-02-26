import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/size/app_size.dart';
import 'package:weather_app/utils/styles/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height / 2.1, bottom: 10.h),
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                  fontSize: 28,
                ),
              ),
              const Spacer(),
              Text(
                'A minimal weather app',
                style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.translucent,
                ),
              ),
              10.getH()
            ],
          ),
        ),
      ),
    );
  }
}
