import 'package:doctor_app/config/routes/app_routes.dart';
import 'package:doctor_app/core/di/di.dart';
import 'package:doctor_app/core/helpers/dialogue_utils.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/validators/validators.dart';
import 'package:doctor_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/re_useable_widgets/app_text_button.dart';
import '../../../../core/re_useable_widgets/app_text_form_field.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/already_have_account.dart';
import '../widgets/password_requirements.dart';
import '../widgets/terms_and_conditions.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  bool isObscureTextPassword = true;
  bool isObscureTextRePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
            context: context,
            message: state.error.errorMessage,
            title: "Failed",
            posActionName: "ok",
          );
        } else if (state is RegisterSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
            context: context,
            message: "Registered Successfully",
            title: "Success",
            posActionName: "ok",
            posAction: () {
              context.pushReplacementNamed(Routes.loginScreen);
            },
          );
        } else {
          DialogueUtils.showLoading(
            context: context,
            message: "Loading.......",
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create Account", style: TextStyles.font24BlueBold),
                  verticalSpace(8),
                  Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(20),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      spacing: 15.h,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppTextFormField(
                          validator: AppValidators.validateUserName,
                          controller: viewModel.nameController,
                          hintText: "Name",
                        ),
                        AppTextFormField(
                          validator: AppValidators.validatePhoneNumber,
                          controller: viewModel.phoneController,
                          hintText: "Phone Number",
                        ),
                        AppTextFormField(
                          validator: AppValidators.validateEmail,
                          controller: viewModel.emailController,
                          hintText: "Email",
                        ),
                        AppTextFormField(
                          validator: AppValidators.validatePassword,
                          controller: viewModel.passwordController,
                          isObscureText: isObscureTextPassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureTextPassword = !isObscureTextPassword;
                              });
                            },
                            child: Icon(
                              isObscureTextPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: "Password",
                        ),
                        AppTextFormField(
                          validator: AppValidators.validatePassword,
                          controller: viewModel.rePasswordController,
                          isObscureText: isObscureTextRePassword,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureTextRePassword =
                                    !isObscureTextRePassword;
                              });
                            },
                            child: Icon(
                              isObscureTextRePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: "Password Confirmation",
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  PasswordRequirements(),
                  verticalSpace(30),
                  AppTextButton(
                    buttonText: "Create Account",
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: viewModel.register,
                  ),
                  verticalSpace(20),
                  TermsAndConditionsText(),
                  verticalSpace(28),
                  AlreadyHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
