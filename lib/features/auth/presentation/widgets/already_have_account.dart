import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(
              text: ' Login',
              style: TextStyles.font13BlueSemiBold,
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      context.pushReplacementNamed(Routes.loginScreen);
                    },
            ),
          ],
        ),
      ),
    );
  }
}
