import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/utils/app_assets.dart';
import '../../../app/utils/app_colors.dart';
import '../../../app/widgets/default_app_bar_widget.dart';
import '../models/about_us_model.dart';
import '../widgets/custom_about_us_item.dart';

class AboutUSScreen extends StatefulWidget {
  const AboutUSScreen({super.key});

  @override
  State<AboutUSScreen> createState() => _AboutUSScreenState();
}

class _AboutUSScreenState extends State<AboutUSScreen> {
  List<AboutUsModel> aboutUSList = [
    AboutUsModel(
        image: "assets/images/engy.jpeg",
        name: "Eng Engy Mostafa",
        phone: "+201118755750",
        emil: "engyelaama1956@gmail.com",
    ),
    AboutUsModel(
      image: "assets/images/Eman.jpeg",
      name: "Eng Eman Khalid ",
      phone: "+201128605322",
      emil: "emanelgendy225@gmail.com ",
    ),
    AboutUsModel(
      image: "assets/images/Amany.jpeg",
      name: "Eng Amany Abdelkader",
      phone: "+201069199158",
      emil: "amanykhaleed299@gmail.com",
    ),
    AboutUsModel(
      image: "assets/images/Mariam.jpeg",
      name: "Mariam Ahmed ",
      phone: "+201029198964",
      emil: "mariamammar2022@icloud.com",
    ),
    AboutUsModel(
      image: "assets/images/KarimHassan.jpeg",
      name: "Eng Karim Hassan",
      phone: "+201067665345",
      emil: "kikomano70@gmail.com",
    ),
    AboutUsModel(
      image: "assets/images/MohamedAdel.jpeg",
      name: "Mohamed Adel",
      phone: "+201552808403",
      emil: "mohamedadel2292002@gmail.com",
    ),
    AboutUsModel(
      image: "assets/images/MohamedGamal.jpeg",
      name: "Eng Mohamed Gamal",
      phone: "+201210890971",
      emil: "mohamedgamal20099@gmail.com",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
       appBar: const DefaultAppBarWidget(
         title: "عن المطورين",
       ),
        body: ListView.builder(
          itemCount: aboutUSList.length,
          padding: EdgeInsets.all(16.sp),
          itemBuilder: (context, index) {
            return CustomAboutUsItem(
                aboutUsModel: aboutUSList[index],
            );
          },
        ),
    );
  }
}
