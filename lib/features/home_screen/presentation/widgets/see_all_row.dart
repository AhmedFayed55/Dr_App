import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Doctor Speciality", style: TextStyles.font18DarkBlueSemiBold),
        Text('See All', style: TextStyles.font12BlueRegular),
      ],
    );
    ;
  }
}
