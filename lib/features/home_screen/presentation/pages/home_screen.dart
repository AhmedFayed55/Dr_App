import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/features/home_screen/presentation/widgets/book_doctor_container.dart';
import 'package:doctor_app/features/home_screen/presentation/widgets/home_top_bar.dart';
import 'package:doctor_app/features/home_screen/presentation/widgets/see_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/doctor_speciality_listview.dart';
import '../widgets/doctors_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const BookDoctorContainer(),
              verticalSpace(20),
              const SeeAllRow(),
              verticalSpace(8),
              const DoctorSpecialityListView(),
              verticalSpace(8),
              DoctorSListView(),
            ],
          ),
        ),
      ),
    );
  }
}
