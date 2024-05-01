import 'package:cars_store/app/utils/app_colors.dart';
import 'package:cars_store/app/utils/consts.dart';
import 'package:cars_store/app/widgets/default_app_bar_widget.dart';
import 'package:cars_store/app/widgets/image_widget.dart';
import 'package:cars_store/app/widgets/text_widget.dart';
import 'package:cars_store/features/home_feature/presentation/widgets/custom_row_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../profile_feature/widgets/custom_about_us_item.dart';
import 'google_maps_screen.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, required this.documentSnapshot});
 final QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  String? imageUrl ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: widget.documentSnapshot["name"],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ImageWidget(
              imageUrl:imageUrl?? widget.documentSnapshot["image"],
            width: 200.w,
            height: 250.h,
            fit: BoxFit.fill,
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    imageUrl = widget.documentSnapshot["image"];
                  });
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.documentSnapshot["image"]),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.grey808080,
                    )
                  ),
                ),
              ),
              widget.documentSnapshot.data().containsKey("image2")?
              InkWell(
                onTap: () {
                  setState(() {
                    imageUrl = widget.documentSnapshot["image2"];
                  });
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.documentSnapshot["image2"]),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.grey808080,
                    )
                  ),
                ),
              )
              :0.horizontalSpace,
              widget.documentSnapshot.data().containsKey("image3")?
              InkWell(
                onTap: () {
                  setState(() {
                    imageUrl = widget.documentSnapshot["image3"];
                  });
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.documentSnapshot["image3"]),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.grey808080,
                      )
                  ),
                ),
              )
              :0.horizontalSpace,
              widget.documentSnapshot.data().containsKey("image4")?
              InkWell(
                onTap: () {
                  setState(() {
                    imageUrl = widget.documentSnapshot["image4"];
                  });
                },
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.documentSnapshot["image4"]),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.grey808080,
                      )
                  ),
                ),
              )
                  :
              0.horizontalSpace,
            ],
          ),
          16.verticalSpace,
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                TextWidget(
                    title: widget.documentSnapshot["price"],
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
                    title: widget.documentSnapshot["model"],
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
                  title: "ElMahala ELkobra , ElShiShiny Mall",
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
                  title1: "Name : ",
                  title2: widget.documentSnapshot.data().containsKey("name")?
                  widget.documentSnapshot["name"]:"",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Model : ",
                  title2: widget.documentSnapshot.data().containsKey("model")?
                  widget.documentSnapshot["model"]:"",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Body Type : ",
                  title2: widget.documentSnapshot.data().containsKey("body type")?
                  widget.documentSnapshot["body type"]:"",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Year : ",
                  title2: widget.documentSnapshot.data().containsKey("year")?
                  widget.documentSnapshot["year"]:"",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Color : ",
                  title2: widget.documentSnapshot.data().containsKey("color")?
                  widget.documentSnapshot["color"]:"",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Type : ",
                  title2: widget.documentSnapshot.data().containsKey("type")?
                  widget.documentSnapshot["type"]:"Automatic",
                ),
                8.verticalSpace,
                CustomRowItem(
                  title1: "Motor CC : ",
                  title2: widget.documentSnapshot.data().containsKey("motor cc")?
                  widget.documentSnapshot["motor cc"]:"0 to 9999",
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                text: "Open Map",
                color: AppColors.green,
                onPressed: () {
                  navigateTo(
                      GoogleMapScreen(
                    lat:30.968686 ,
                    long:31.168788
                  ),
                  );
                },
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: ButtonWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                text: "Follow Us",
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
                text: "Call Us",
                onPressed: ()async {
                  await launchWhatsapp(phone: "+201118755750");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
