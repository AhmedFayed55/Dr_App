import 'package:doctor_app/core/utils/colors.dart';
import 'package:doctor_app/core/utils/images.dart';
import 'package:doctor_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              spacing: 8.h,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.lightBlue,
                  child: SvgPicture.asset(
                    AppImages.doctorSpecialityTestSvg,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
                Text("Category", style: TextStyles.font12DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
