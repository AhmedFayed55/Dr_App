import 'package:doctor_app/core/utils/images.dart';
import 'package:doctor_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.docDocLogoLowOpacitySvg),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4], // كل لون هيقف فين
            ),
          ),
          child: Image.asset(AppImages.onboardingDoctorPng),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30.h,
          child: Text(
            "Best Doctor \n Appointment App",
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
