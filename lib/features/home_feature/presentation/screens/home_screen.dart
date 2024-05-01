import 'package:cars_store/app/widgets/carousel_widget/carousel_widget.dart';
import 'package:cars_store/app/widgets/loading.dart';
import 'package:cars_store/features/home_feature/presentation/screens/all_cars_screen.dart';
import 'package:cars_store/features/home_feature/presentation/screens/video_play_screen.dart';
import 'package:cars_store/features/home_feature/presentation/widgets/custom_home_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../../main.dart';
import '../../../profile_feature/screens/about_us_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: Column(
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.sp),
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("cats")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data?.docs.length ?? 0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    navigateTo(AllCarsScreen(
                                      appBarTitle: snapshot.data
                                          ?.docs[index]["name"],
                                      id: snapshot.data?.docs[index]["id"],
                                    ));
                                  },
                                  child: CustomHomeItem(
                                    image: snapshot.data?.docs[index]["image"],
                                    title: snapshot.data?.docs[index]["name"],
                                  ));
                            },
                            separatorBuilder: (context, index) =>
                            16.verticalSpace,
                          );
                        } else {
                          return const Center(child: Loading());
                        }
                      }
                  )
                ],
              ),
            )


          ],
        ),
      );
    }
  }