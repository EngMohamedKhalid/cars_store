import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/widgets/text_widget.dart';
import '../../../app/utils/app_assets.dart';
import '../../../app/utils/app_colors.dart';
import '../../../app/widgets/image_widget.dart';
import '../models/about_us_model.dart';
class CustomAboutUsItem extends StatelessWidget {
  const CustomAboutUsItem({super.key, required this.aboutUsModel});
   final AboutUsModel aboutUsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.only(bottom :16.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageWidget(
                  imageUrl: aboutUsModel.image,
                  width: 100.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: aboutUsModel.name,
                      titleColor: AppColors.black,
                      titleAlign: TextAlign.start,
                      titleSize: 20.sp,
                    ),
                    // 3.verticalSpace,
                    // TextWidget(
                    //   title: aboutUsModel.job??"",
                    //   titleColor: AppColors.gery455,
                    //   titleAlign: TextAlign.start,
                    //   titleSize: 15.sp,
                    // ),
                    10.verticalSpace,
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: ImageWidget(
                            imageUrl: AppImages.whatsapp,
                            width: 35.w,
                            height: 35.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        10.horizontalSpace,
                        InkWell(
                          onTap: ()async {
                            await launchWhatsapp(phone: aboutUsModel.phone);
                          },
                          child: TextWidget(
                            title: aboutUsModel.phone,
                            titleColor: AppColors.green,
                            titleSize: 16.sp,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: ImageWidget(
                            imageUrl: AppImages.google,
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                                await launchEmail(url: "mailto:${aboutUsModel.emil}");
                            },
                            child: TextWidget(
                              title: aboutUsModel.emil,
                              titleColor: AppColors.green,
                              titleSize: 15.sp,
                              titleAlign: TextAlign.start,  
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

}
Future<void> launchWhatsapp({required String phone}) async{
  String url = 'https://wa.me/$phone/?text=${Uri.parse("Hello, Are you have a time for chating!")}';
  if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)){
    throw Exception('Could not launch $url');
  }
}

Future<void> launchEmail({required String url}) async{
  if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)){
    throw Exception('Could not launch $url');
  }
}