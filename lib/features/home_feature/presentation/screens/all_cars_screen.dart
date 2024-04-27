import 'package:cars_store/app/utils/app_colors.dart';
import 'package:cars_store/app/utils/helper.dart';
import 'package:cars_store/app/widgets/custom_form_field.dart';
import 'package:cars_store/app/widgets/default_app_bar_widget.dart';
import 'package:cars_store/app/widgets/text_widget.dart';
import 'package:cars_store/features/home_feature/presentation/screens/car_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/loading.dart';
import '../widgets/custom_home_item.dart';

class AllCarsScreen extends StatefulWidget {
  const AllCarsScreen({super.key, this.appBarTitle, required this.id});
 final String ? appBarTitle;
 final String  id;

  @override
  State<AllCarsScreen> createState() => _AllCarsScreenState();
}

class _AllCarsScreenState extends State<AllCarsScreen> {
 late String searchText ;
 @override
  void initState() {
   searchText = widget.appBarTitle??"BMB";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: widget.appBarTitle??"BMB Cars",
        centerTitle: true,

      ),
      body:
      Column(
        children: [
          CustomFormField(
            width: MediaQuery.of(context).size.width-32.w,
            prefixIcon: Icons.search,
            hint: "Search For Cars",
            onChange: (value) {
              if(value.isEmpty){
                searchText = widget.appBarTitle??"BMB";
                setState(() {});
              } else {
                searchText = value;
                setState(() {});
              }
            },
          ),
          16.verticalSpace,
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("cars").where("catId",isEqualTo: widget.id).where("name",isEqualTo: searchText).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return
                  snapshot.data?.docs.length==0?
                      Center(
                        child: TextWidget(
                            title: "No Cars Found",
                            titleSize: 20.sp,
                          titleFontWeight: FontWeight.bold,
                          titleColor: AppColors.black,
                        ),
                      ):
                    ListView.separated(
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
            ),
          ),
        ],
      )
    );
  }
}
