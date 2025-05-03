import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        spacing: 16.w,
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
            // progressIndicatorBuilder: (context, url, downloadProgress) {
            //   return Shimmer.fromColors(
            //     baseColor: AppColors.lightGray,
            //     highlightColor: Colors.white,
            //     child: Container(
            //       width: 110.w,
            //       height: 120.h,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(12.0),
            //         color: Colors.white,
            //       ),
            //     ),
            //   );
            // },
            imageBuilder:
                (context, imageProvider) => Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Randy Wigham",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  'Degree | 01096645124',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text('Emailhks@gmail.com', style: TextStyles.font12GrayMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
