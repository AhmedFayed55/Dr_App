import 'package:doctor_app/config/routes/app_routes.dart';
import 'package:doctor_app/core/helpers/dialogue_utils.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/re_useable_widgets/app_text_button.dart';
import 'package:doctor_app/core/re_useable_widgets/app_text_form_field.dart';
import 'package:doctor_app/core/validators/validators.dart';
import 'package:doctor_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/or_sign_in_with.dart';
import '../widgets/other_sign_in_methods.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
              context: context, message: "Something went wrong",
              title: "Error", posActionName: "Ok");
        } else if (state is LoginSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(context: context,
              message: "Login Successfully",
              title: "Success",
              posActionName: "Ok",
              posAction: () {
                context.pushNamed(Routes.homeScreen);
              });
        } else {
          DialogueUtils.showLoading(
              context: context, message: "Loading.........");
        }
      },
      child: Scaffold(
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
                  Form(key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTextFormField(
                              controller: viewModel.emailController,
                              hintText: "Email",
                              validator: AppValidators.validateEmail),
                          verticalSpace(18),
                          AppTextFormField(
                              controller: viewModel.passwordController,
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
                              validator: (AppValidators.validatePassword)),
                          verticalSpace(20),
                          Text("Forgot Password?",
                            style: TextStyles.font13BlueRegular,),
                        ],
                      )),
                  verticalSpace(30),
                  AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        viewModel.login();
                      }),
                  verticalSpace(45),
                  const OrSignInWith(),
                  verticalSpace(45),
                  const OtherSignInMethods(),
                  verticalSpace(25),
                  const TermsAndConditionsText(),
                  verticalSpace(25),
                  const DontHaveAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
