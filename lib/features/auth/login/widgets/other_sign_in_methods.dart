import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/images.dart';

class OtherSignInMethods extends StatelessWidget {
  const OtherSignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(AppImages.googleLogoSvg),
        SvgPicture.asset(AppImages.facebookLogoSvg),
        SvgPicture.asset(AppImages.appleLogoSvg),
      ],
    );
  }
}
