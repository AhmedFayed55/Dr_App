import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/re_useable_widgets/app_text_button.dart';
import 'package:doctor_app/core/re_useable_widgets/app_text_form_field.dart';
import 'package:doctor_app/features/auth/login/widgets/dont_have_account.dart';
import 'package:doctor_app/features/auth/login/widgets/or_sign_in_with.dart';
import 'package:doctor_app/features/auth/login/widgets/other_sign_in_methods.dart';
import 'package:doctor_app/features/auth/login/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppTextFormField(
                            hintText: "Email", validator: (name) {}),
                        verticalSpace(18),
                        AppTextFormField(
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              ),
                            ),
                            hintText: "Password",
                            validator: (name) {}),
                        verticalSpace(20),
                        Text("Forgot Password?",
                          style: TextStyles.font13BlueRegular,),
                      ],
                    )),
                verticalSpace(30),
                AppTextButton(
                    buttonText: "Login",
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {}),
                verticalSpace(45),
                OrSignInWith(),
                verticalSpace(45),
                OtherSignInMethods(),
                verticalSpace(25),
                const TermsAndConditionsText(),
                verticalSpace(25),
                const DontHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






