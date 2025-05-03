import 'package:doctor_app/core/utils/colors.dart';
import 'package:doctor_app/core/utils/images.dart';
import 'package:doctor_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Ahmed!", style: TextStyles.font18DarkBlueBold),
            Text("How Are you Today?", style: TextStyles.font12GrayRegular),
          ],
        ),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: AppColors.moreLighterGray,
          child: SvgPicture.asset(AppImages.notificationsSvg),
        ),
      ],
    );
  }
}
