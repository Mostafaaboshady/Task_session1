import 'package:flutter/material.dart';
import 'package:goldex/core/constants/app_colors.dart';
import 'package:goldex/core/constants/app_string.dart';
import 'package:goldex/core/routing/routes.dart' show AppRoutes;
import 'package:goldex/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: APPStrings.gold,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.GoldScreen);
              Colors.white;
            },
            color: AppColors.goldColor,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: APPStrings.silver,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.SilverScreen);
              Colors.white;
            },
            color: AppColors.silverColor,
          ),
        ],
      ),
    );
  }
}
