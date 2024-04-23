import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 21.sp,),
              children: [
                ImageWidget(
                  imageUrl: AppImages.appLogo,
                  width: 100.w,
                  height: 150.h,
                ),
                16.verticalSpace,
                TextWidget(
                  title: "ResetPassword".tr(),
                  titleSize: 24.sp,
                  titleColor: AppColors.mainColor,
                  titleFontWeight: FontWeight.w400,
                ),
                40.verticalSpace,
                CustomFormField(
                  hint: "EnterOTP".tr(),
                  controller: cubit.otpController,
                  keyboardType: TextInputType.number,
                  maxLength:4,
                  validator:(value) {
                    if (value!.isEmpty) {
                      return "FieldMustNotBeEmpty".tr();
                    }else if(value.length<4){
                      return "OtpMustBe4Digits".tr();
                    }
                    return null;
                  },
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "enterNewPassword".tr(),
                  controller: cubit.resetPassController,
                  suffixIcon:cubit.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cubit.passObscure,
                  iconPressed: () {
                    cubit.changeVisible();
                  },
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "enterNewPasswordCon".tr(),
                  controller: cubit.resetPassConfirmController,
                  suffixIcon:
                  cubit.passConfObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cubit.passConfObscure,
                  iconPressed: () {
                    cubit.changeConfVisible();
                  },
                ),
                100.verticalSpace,
                ButtonWidget(
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // cubit.resetPassword(
                      //     ResetPassUseCaseParams(
                      //       email: cubit.otpEmailController.text,
                      //       otp: cubit.otpController.text,
                      //       password: cubit.resetPassController.text,
                      //       password_confirmation:cubit.resetPassConfirmController.text,
                      //     )
                      // );
                    }
                  },
                  loading: state is LoadingState,
                  text: "Reset Password",
                ),
                16.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
