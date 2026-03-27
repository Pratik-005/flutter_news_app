import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key}) : preferredSize = Size.fromHeight(50.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Tech', size: 20, color: AppColors.primary),
            ModifiedText(text: 'Newz', size: 20, color: AppColors.lightwhite),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
