import 'package:cars_store/app/utils/consts.dart';
import 'package:cars_store/app/widgets/carousel_widget/carousel_widget.dart';
import 'package:cars_store/app/widgets/image_widget.dart';
import 'package:cars_store/app/widgets/loading.dart';
import 'package:cars_store/features/home_feature/presentation/screens/all_cars_screen.dart';
import 'package:cars_store/features/home_feature/presentation/screens/video_play_screen.dart';
import 'package:cars_store/features/home_feature/presentation/widgets/custom_home_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../../main.dart';
import '../../../profile_feature/screens/about_us_screen.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  List <String> images = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
  ];
  List <String> reals = [
    "https://vm.tiktok.com/ZMMqCVoaW/",
    "https://vm.tiktok.com/ZMMqCVoaW/",
    "https://vm.tiktok.com/ZMMqCVoaW/",
    "https://vm.tiktok.com/ZMMqCVoaW/",
    "https://vm.tiktok.com/ZMMqCVoaW/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.w,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.w),
                    bottomRight: Radius.circular(20.w),
                  )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  16.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        title: "Welcome,",
                        titleColor: Colors.white,
                        titleSize: 18.sp,
                      ),
                      5.verticalSpace,
                      FutureBuilder(
                          future: FirebaseFirestore.instance.collection("users")
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return TextWidget(
                                title: snapshot.data?["name"] ??
                                    "Mohamed Khalid",
                                titleColor: Colors.white,
                                titleSize: 16.sp,
                              );
                            }
                            return const Text("");
                          }
                      ),
                      4.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                          TextWidget(
                            title: "$myLocationCity , $myLocationName",
                            titleColor: Colors.white,
                            titleSize: 13.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      navigateTo(const AboutUSScreen());
                    },
                    child: Icon(
                      Icons.groups,
                      size: 30.sp,
                      color: AppColors.white,
                    ),
                  ),
                  16.horizontalSpace
        
                ],
              ),
        
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CarouselWidget(
                items: List<Widget>.generate(
                  images.length,
                      (index) =>
                      InkWell(
                        onTap: () {
                          navigateTo(VideoPlayerScreen(url: reals[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffD4E5D3),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(images[index]),
                              ),
                              borderRadius: BorderRadius.circular(16.sp)
                          ),
                        ),
                      ),
                ),
              ),
            ),
            250.verticalSpace,
            Row(
              children: [
                16.horizontalSpace,
                TextWidget(
                  title: "Contact Us On :",
                  titleColor: AppColors.black,
                  titleSize: 18.sp,
                ),
                16.horizontalSpace
              ],
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: ()async {
                       await launchUrlFu(url: "https://www.facebook.com/BerlinAutomotive.eg?mibextid=ZbWKwL");
                      },
                    child: ImageWidget(imageUrl: "assets/images/facebook_icon.png"))),
                Expanded(
                    child: InkWell(
                      onTap: ()async {
                        await launchUrlFu(url: "https://www.instagram.com/berl_incars?igsh=anJ5dDJldjNuMGJp");
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/instagram.png"
                            )
                          )
                        ),
                      ),
                    ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await launchWhatsapp(phone: "+201118755750");
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/whatsapp_image.png"
                              )
                          )
                      ),
                    ),
                  ),
                ),
              ],
            )
        
          ],
        ),
      ),
    );
  }
  Future<void> launchWhatsapp({required String phone}) async{
    String url = 'https://wa.me/$phone/?text=${Uri.parse("Hello, Are you have a time for chating!")}';
    if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }
  }
}