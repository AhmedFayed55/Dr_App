import 'package:doctor_app/config/routes/app_routes.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/utils/colors.dart';
import 'package:doctor_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: TextButton.styleFrom(
        backgroundColor: AppColors.mainBlue,
        minimumSize: Size(double.infinity, 52.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text("Get Started", style: TextStyles.font16WhiteSemiBold),
    );
  }
}
