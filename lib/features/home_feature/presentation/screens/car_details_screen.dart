import 'package:cars_store/app/utils/app_colors.dart';
import 'package:cars_store/app/utils/consts.dart';
import 'package:cars_store/app/widgets/default_app_bar_widget.dart';
import 'package:cars_store/app/widgets/image_widget.dart';
import 'package:cars_store/app/widgets/text_widget.dart';
import 'package:cars_store/features/home_feature/presentation/widgets/custom_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../profile_feature/widgets/custom_about_us_item.dart';
import 'google_maps_screen.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "BMW Details",
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            ImageWidget(
                imageUrl: "assets/images/3.jpeg",
              width: 200.w,
              height: 250.h,
              fit: BoxFit.fill,
            ),
            16.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  TextWidget(
                      title: "3,100,000 L.E",
                    titleFontWeight: FontWeight.w600,
                    titleColor: AppColors.red,
                  ),
                ],
              ),
            ),
            5.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  TextWidget(
                      title: "Brand New BMW 200 - 2024",
                    titleFontWeight: FontWeight.bold,
                    titleColor: AppColors.black,
                    titleSize: 16.sp,
                  ),
                ],
              ),
            ),
            6.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  3.horizontalSpace,
                  TextWidget(
                    title: "Alexandria, Egypt",
                    titleFontWeight: FontWeight.w500,
                    titleColor: AppColors.black,
                    titleSize: 14.sp,
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              color: AppColors.grey808080.withOpacity(.2),
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  CustomRowItem(
                    title1: "الماركه : ",
                    title2: "BMW",
                  ),
                  8.verticalSpace,
                  CustomRowItem(
                    title1: "السنة : ",
                    title2: "2024",
                  ),
                  8.verticalSpace,
                  CustomRowItem(
                    title1: "اللون : ",
                    title2: "ابيض",
                  ),
                  8.verticalSpace,
                  CustomRowItem(
                    title1: "نوع الوقود : ",
                    title2: "بنزين",
                  ),
                  8.verticalSpace,
                  CustomRowItem(
                    title1: "كيلومترات : ",
                    title2: "0 الي 9999",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                text: "افتح الموقع",
                color: AppColors.green,
                onPressed: () {
                  navigateTo(
                      GoogleMapScreen(
                    lat:31.185105 ,
                    long:29.934575
                  ),
                  );
                },
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: ButtonWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                text: "تابعنا",
                color: AppColors.green,
                onPressed: ()async {
                  await launchUrlFu(url: "https://www.facebook.com/share/E4BvAwbmxzGBJQj2/?mibextid=LQQJ4d");
                },

              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: ButtonWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                color: AppColors.green,
                text: "كلمنا",
                onPressed: ()async {
                  await launchWhatsapp(phone: "+201016738840");
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
