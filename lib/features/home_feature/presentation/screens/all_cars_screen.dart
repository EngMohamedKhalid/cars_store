import 'package:cars_store/app/utils/helper.dart';
import 'package:cars_store/app/widgets/default_app_bar_widget.dart';
import 'package:cars_store/features/home_feature/presentation/screens/car_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/loading.dart';
import '../widgets/custom_home_item.dart';

class AllCarsScreen extends StatelessWidget {
  const AllCarsScreen({super.key, this.appBarTitle, required this.id});
 final String ? appBarTitle;
 final String  id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: appBarTitle??"BMB Cars",
        centerTitle: true,

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("cars").where("catId",isEqualTo: id).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return  ListView.separated(
              itemCount: snapshot.data?.docs.length??0,
              padding: EdgeInsets.all(16.sp),
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateTo(CarDetailsScreen(
                      documentSnapshot:snapshot.data!.docs[index] ,
                    ));
                  },
                  child: CustomHomeItem(
                    image: snapshot.data?.docs[index]["image"],
                    hasSeeMore: true,
                    title: snapshot.data?.docs[index]["name"],
                    description: snapshot.data?.docs[index]["model"],
                  ),
                );
              },

            );
          }else{
            return Center(child: const Loading());
          }
        },
      )
    );
  }
}
