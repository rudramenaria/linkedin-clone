import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/assets/assets.dart';
import 'package:linkedin_clone/common/assets/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, -250),
            child: Transform.scale(
              scale: 3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Center(child: Image.asset(AppAssets.logo)),
        ],
      ),
    );
  }
}
