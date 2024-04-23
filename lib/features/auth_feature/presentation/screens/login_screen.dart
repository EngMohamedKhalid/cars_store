import 'package:cars_store/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/utils/app_assets.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/utils/helper.dart';
import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/custom_form_field.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_button_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cu = AuthCubit.get();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 21.sp, ),
              children: [
                50.verticalSpace,
                ImageWidget(
                  imageUrl: AppImages.appLogo,
                  width: 100.w,
                  height: 150.h,
                ),
                50.verticalSpace,
                CustomFormField(
                  hint: "enterEmail".tr(),
                  controller: cu.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText:  cu.errorMsg,
                ),
                24.verticalSpace,
                CustomFormField(
                  hint: "enterPassword".tr(),
                  controller: cu.loginPasswordController,
                  suffixIcon: cu.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passObscure,
                  iconPressed: () {
                    cu.changeVisible();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      onPressed: () {
                        navigateTo( ForgetPasswordScreen());
                      },
                      title: "forgetPass".tr(),
                      titleColor: AppColors.mainColor,
                      textDecoration: TextDecoration.underline,
                      titleFontWeight: FontWeight.w500,
                      titleSize: 15.sp,
                    ),
                  ],
                ),
                100.verticalSpace,
                ButtonWidget(
                  loading: state is LoadingState,
                  width: 200.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      cu.login();
                    }
                  },
                  text: "login".tr(),
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: "Don't have an account?",
                      titleSize: 15.sp,
                      titleColor: AppColors.gery455,
                      titleFontWeight: FontWeight.w500,
                    ),
                    //5.horizontalSpace,
                    CustomTextButton(
                      onPressed: () {
                        navigateTo(const RegisterScreen(),replace: true);
                      },
                      title: "Create Account",
                      textDecoration: TextDecoration.underline,
                      titleColor: AppColors.mainColor,
                      titleFontWeight: FontWeight.w500,
                      titleSize: 14.sp,
                    ),
                  ],
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
