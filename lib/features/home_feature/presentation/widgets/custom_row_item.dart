import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
class CustomRowItem extends StatelessWidget {
  const CustomRowItem({super.key, this.title1, this.title2});
final String? title1;
final String? title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title:title1??"السعر : ",
          titleColor: AppColors.black,
          titleSize: 18.sp,
        ),
        Expanded(
          child: TextWidget(
            title:title2??"",
            titleColor: AppColors.black,
            titleSize: 18.sp,
            titleFontWeight: FontWeight.w500,
            //titleAlign: TextAlign.start,
            titleMaxLines: 1000,
          ),
        ),
      ],
    );
  }
}
