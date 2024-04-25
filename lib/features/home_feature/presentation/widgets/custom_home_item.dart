import 'package:cars_store/app/widgets/carousel_widget/carousel_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../../main.dart';
class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({super.key, required this.image, this.title, this.description, this.hasSeeMore = false});
 final String image;
 final String? title;
 final String ?description;
 final bool hasSeeMore;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
              borderRadius: BorderRadius.circular(16.sp)
          ),
        ),
        Container(
          height: 200.h,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
            color: Colors.white,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.9),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextWidget(
                title:title??"BMW Cars",
                titleFontWeight: FontWeight.w400,
                titleColor: AppColors.white,
                titleSize: 20.sp,
              ),
              4.verticalSpace,
             hasSeeMore?
             TextWidget(
                title:description??"116 LAT HISTORII HOTELU BRISTOL W WARSZAWIE",
                titleFontWeight: FontWeight.w400,
                titleColor: AppColors.white,
                titleMaxLines: 1,
                titleSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              )
                 :0.verticalSpace,
              Row(),
              8.verticalSpace,
              hasSeeMore ?
              Container(
                height: 38.h,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color: const Color(0xffAFB8C1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      title:"See More",
                      titleFontWeight: FontWeight.w500,
                      titleColor: AppColors.white,
                      titleSize: 14.sp,
                    ),
                    4.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
                  :
              0.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
