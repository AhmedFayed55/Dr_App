import 'package:doctor_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PasswordRequirements extends StatelessWidget {
  const PasswordRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordRequirementsText(text: "1 lowercase letter"),
        PasswordRequirementsText(text: "1 uppercase letter"),
        PasswordRequirementsText(text: "1 special character"),
        PasswordRequirementsText(text: "8 characters long"),
      ],
    );
  }
}

class PasswordRequirementsText extends StatelessWidget {
  const PasswordRequirementsText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text("✶ At least $text", style: TextStyles.font15BlackRegular);
  }
}
