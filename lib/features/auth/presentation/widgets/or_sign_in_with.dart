import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.lightGray,
            thickness: 1.3,
            indent: 4.w,
          ),
        ),
        Text("Or sign in with", style: TextStyles.font12GrayRegular),
        Expanded(
          child: Divider(
            color: AppColors.lightGray,
            thickness: 1.3,
            endIndent: 4.w,
          ),
        ),
      ],
    );
  }
}
