// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../app/utils/app_assets.dart';
// import '../../../../../app/utils/app_colors.dart';
// import '../../../../../app/utils/helper.dart';
// import '../../../../../app/widgets/button_widget.dart';
// import '../../../../../app/widgets/custom_form_field.dart';
// import '../../../../../app/widgets/image_widget.dart';
// import '../../../../../app/widgets/text_button_widget.dart';
// import '../../../../../app/widgets/text_widget.dart';
// import '../../../../app/widgets/default_app_bar_widget.dart';
// import '../presentation_logic_holder/auth_cubit.dart';
// import 'login_screen.dart';
//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
// final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const DefaultAppBarWidget(
//         canBack: false,
//       ),
//       body: BlocBuilder<AuthCubit, AuthState>(
//         builder: (context, state) {
//           var cubit = AuthCubit.get();
//           return Form(
//             key: formKey,
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 21.sp, vertical: 50),
//               children: [
//                 ImageWidget(
//                   imageUrl: AppImages.spots,
//                   width: 75.w,
//                   height: 75.h,
//                 ),
//                 16.verticalSpace,
//                 TextWidget(
//                   title: "Forget Password?",
//                   titleSize: 24.sp,
//                   titleColor: AppColors.mainColor,
//                   titleFontWeight: FontWeight.w400,
//                 ),
//                 323.verticalSpace,
//                 ButtonWidget(
//                   onPressed: () {
//                     // if (formKey.currentState!.validate()) {
//                     //   //navigateTo(const ResetPasswordScreen());
//                     // }
//
//                   },
//                   text: "Verify OTP",
//                 ),
//                 57.verticalSpace,
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
