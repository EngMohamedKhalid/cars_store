import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/helper.dart';
import '../utils/app_fonts.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? header;
  final double? width;
  final double? height;
  final bool? obscure;
  final String? labelText;
  final String? validateText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Widget? prefixIconWidget;
  final Color? labelColor;
  final Function(String)? onChange;
  final Function()? iconPressed;
  final GestureTapCallback? onPressed;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool? enabled;
  final bool? filled;
  final TextAlign? align;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Color? color;
  final Color? suffixColor;
  final Color? fillColor;
  final Color? hintColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusValue;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disableBorder;
  final String? errorText;

  const CustomFormField({
    super.key,
    this.controller,
    this.hint = "",
    this.width,
    this.height,
    this.obscure = false,
    this.header,
    this.labelText,
    this.suffixIcon,
    this.suffixIconWidget,
    this.enabled = true,
    this.labelColor,
    this.hintColor,
    this.onPressed,
    this.align,
    this.prefixIcon,
    this.prefixIconWidget,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.iconPressed,
    this.color,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.contentPadding,
    this.borderRadius,
    this.borderRadiusValue,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disableBorder, this.filled,
    this.fillColor, this.prefixIconColor,
    this.onFieldSubmitted, this.validateText,
    this.suffixColor, this.onTap,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header == null
            ? const SizedBox()
            : Text(
          header ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: header == null ? 0 : 5.h,
        ),
        SizedBox(
          height: height??60.h,
          child: InkWell(
            onTap: onPressed,
            child: TextFormField(
              cursorColor: AppColors.black,
              maxLength:maxLength ,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onTap:onTap?? () {},
              onFieldSubmitted:onFieldSubmitted??(st){} ,
              validator: validator ??
                      (value) {
                    if (value!.isEmpty) {
                      return validateText?? "FieldMustNotBeEmpty".tr();
                    }
                    return null;
                  },
              textInputAction: textInputAction,
              controller: controller,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              enabled: enabled,
              keyboardType: keyboardType,
              focusNode: focusNode,
              onChanged: onChange,
              obscureText: obscure ?? false,
              textAlign: align ?? TextAlign.start,
              style: TextStyle(
                height: 1.2.h,
                fontFamily: fontMedium,
                color: AppColors.black,
                fontSize: 14.sp,
              ),
              cursorHeight: 20.h,
              decoration: InputDecoration(
                fillColor: fillColor??Color(0xffEDEDEB),
                filled:filled??true ,
                counterText: "",
                isDense: true,
                errorText: errorText,
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20
                    ),
                errorStyle: TextStyle(
                  fontSize: 9.sp,
                  height: 1.2.h,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadiusValue ?? 15),
                    borderSide: const BorderSide(
                       color: AppColors.mainColor,
                    )
                ),
                enabledBorder: enabledBorder ?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadiusValue ?? 15),
                    borderSide: const BorderSide(
                      color: AppColors.mainColor,
                    )
                ),
                disabledBorder:disableBorder?? OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(borderRadiusValue ?? 15),
                    borderSide: const BorderSide(color:AppColors.mainColor,)
                ),
                errorBorder: errorBorder ?? OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(borderRadiusValue ?? 15),
                    borderSide: const BorderSide(color: AppColors.mainColor,)
                ),
                focusedBorder: focusedBorder ?? OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(borderRadiusValue ?? 15),
                    borderSide:
                    const BorderSide(
                      color: AppColors.mainColor,
                    )),
                hintText: hint ?? "",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color:hintColor?? AppColors.black,
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.field,
                  fontFamily: fontRegular,
                ),
                suffixIcon: suffixIconWidget == null
                    ? (suffixIcon == null
                    ? null
                    : InkWell(
                    onTap: iconPressed ?? () {},
                    child:
                    Icon(
                      suffixIcon,
                      size: 23.sp,
                      color:suffixColor?? AppColors.black,
                    )))
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    suffixIconWidget!,
                  ],
                ),
                prefixIcon: prefixIconWidget == null
                    ? (prefixIcon == null
                    ? null
                    : Icon(
                  prefixIcon,
                  size: 23.sp,
                  color:prefixIconColor?? AppColors.field,
                ))
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    prefixIconWidget!,
                    SizedBox(
                      width: 16.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
