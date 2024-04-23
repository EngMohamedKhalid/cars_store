import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'text_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool actions;
  final bool notify;
  final bool? centerTitle;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool  shapeBorder;
  final Widget? titleWidget;
  final VoidCallback? onPop;
  final VoidCallback? actionsOnPressed;
  final bool canBack;
  final Color ? backColor;
  final double? leadingWidth;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final List<Widget>? actionsWidgets;

  const DefaultAppBarWidget(
      {this.title,
      this.actions = false,
      Key? key,
      this.onPop,
      this.canBack = true, this.leading,  this.notify=true, this.actionsOnPressed, this.titleWidget,
        this.leadingWidth,
        this.actionsWidgets, this.backColor, this.systemUiOverlayStyle, this.centerTitle, this.shapeBorder = false, this.bottom,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: bottom,
      shape: shapeBorder?const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
      ):const RoundedRectangleBorder(),
      centerTitle: centerTitle,
      systemOverlayStyle: systemUiOverlayStyle,
      backgroundColor:backColor ,
      leading: canBack
          ? IconButton(
        alignment: Alignment.center,
              onPressed: onPop ??
                  () {
                    Navigator.pop(context);
                  },
              icon: Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:shapeBorder?AppColors.geryF0 : Colors.white,
                    // border: Border.all(
                    //   color: AppColors.white,
                    //   width: 1,
                    // ),
                ),
                child:leading?? Icon(
                  Icons.arrow_back_ios,
                  color:AppColors.mainColor,
                  size: 20.sp,
                ),
              ),
            )
          : null,
      title: titleWidget?? TextWidget(
        title: title??"",
        fontFamily: AppFonts.bold,
        titleSize: 18.sp,
          titleColor: AppColors.mainColor
      ),
      actions: actions
          ? [
             Container(
               width: 48.w,
               height: 48.h,
               margin: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 14.w),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.r),
                 color: AppColors.gery455.withOpacity(.05)
               ),
               child:
               notify?
               Stack(
                 alignment: Alignment.topRight,
                 children: [
                   IconButton(
                       onPressed:actionsOnPressed?? (){},
                       icon: Icon(
                         Icons.notifications,
                         color: AppColors.gery455,
                         size: 30.sp,
                       ),
                   ),
                   Positioned(
                     right: 10.w,
                     top: 10.h,
                     child: CircleAvatar(
                       radius: 4.r,
                       backgroundColor: AppColors.red,
                     ),
                   )
                 ],
               )
                   :
               IconButton(
                 onPressed:actionsOnPressed?? (){},
                 icon: Icon(
                   Icons.notifications,
                   color: AppColors.gery455,
                   size: 30.sp,
                 ),
               ),
             )
            ]
          : actionsWidgets,
      leadingWidth:leadingWidth ,
      toolbarHeight: 70.h,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 66);
}
