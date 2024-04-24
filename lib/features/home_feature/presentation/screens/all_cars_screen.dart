import 'package:cars_store/app/utils/helper.dart';
import 'package:cars_store/app/widgets/default_app_bar_widget.dart';
import 'package:cars_store/features/home_feature/presentation/screens/car_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_home_item.dart';

class AllCarsScreen extends StatelessWidget {
  const AllCarsScreen({super.key, this.appBarTitle});
 final String ? appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: appBarTitle??"BMB Cars",
        centerTitle: true,

      ),
      body: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.all(16.sp),
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateTo(CarDetailsScreen());
            },
            child: const CustomHomeItem(
              image: "assets/images/3.jpeg",
              hasSeeMore: true,
            ),
          );
        },

      ),
    );
  }
}
