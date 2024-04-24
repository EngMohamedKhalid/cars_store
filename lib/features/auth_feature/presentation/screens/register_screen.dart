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
import '../../../../app/widgets/flutter_toast.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              padding: EdgeInsets.symmetric(horizontal: 21.sp,),
              children: [
                50.verticalSpace,
                ImageWidget(
                  imageUrl: AppImages.appLogo,
                  width: 100.w,
                  height: 200.h,
                ),
                // 50.verticalSpace,
                CustomFormField(
                  hint: "Enter Name".tr(),
                  controller: cu.registerNameController,
                  errorText:  cu.errorMsg,
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "enterEmail".tr(),
                  controller: cu.registerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText:  cu.errorMsg,
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "Enter Phone",
                  controller: cu.registerPhoneController,
                  keyboardType: TextInputType.phone,
                  errorText:  cu.errorMsg,
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "enterPassword".tr(),
                  controller: cu.registerPassController,
                  suffixIcon: cu.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passObscure,
                  iconPressed: () {
                    cu.changeVisible();
                  },
                ),
                16.verticalSpace,
                CustomFormField(
                  hint: "Confirm Password",
                  controller: cu.registerConfPassController,
                  suffixIcon: cu.passConfObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cu.passConfObscure,
                  iconPressed: () {
                    cu.changeConfVisible();
                  },
                ),
                70.verticalSpace,
                ButtonWidget(
                  loading: state is LoadingState,
                  width: 200.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    if(formKey.currentState!.validate()&&cu.registerPassController.text==cu.registerConfPassController.text){
                      cu.register();
                    }else{
                      showToast(msg: "Password does not match confirm password", backgroundColor: AppColors.red, textColor: Colors.white);
                    }
                  },
                  text: "Create Account",
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: "Do you have an account?",
                      titleSize: 15.sp,
                      titleColor: AppColors.gery455,
                      titleFontWeight: FontWeight.w500,
                    ),
                    //5.horizontalSpace,
                    CustomTextButton(
                      onPressed: () {
                        navigateTo(const LoginScreen(),replace: true);
                      },
                      title: "Login",
                      textDecoration: TextDecoration.underline,
                      titleColor: AppColors.mainColor,
                      titleFontWeight: FontWeight.w500,
                      titleSize: 15.sp,
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
