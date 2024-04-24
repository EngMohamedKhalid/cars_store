import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/utils/app_assets.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/custom_form_field.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const DefaultAppBarWidget(
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get();
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 21.sp, vertical: 50),
              children: [
                ImageWidget(
                  imageUrl: AppImages.appLogo,
                  width: 100.w,
                  height: 200.h,
                ),
                16.verticalSpace,
                TextWidget(
                  title: "forgetPass".tr(),
                  titleSize: 24.sp,
                  titleColor: AppColors.mainColor,
                  titleFontWeight: FontWeight.w400,
                ),
                40.verticalSpace,
                CustomFormField(
                  hint: "enterEmail".tr(),
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.otpEmailController,
                ),
                100.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.sendOtp();
                    }
                    },
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: "send Otp",
                  loading: state is LoadingState,
                ),
                57.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
