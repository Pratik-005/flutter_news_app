import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(color: AppColors.lightwhite),
    );
  }
}
