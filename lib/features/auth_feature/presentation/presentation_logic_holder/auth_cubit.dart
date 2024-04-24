import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import '../../domain/use_cases/auth_usecases/resend_otp_usecase.dart';
import '../screens/login_screen.dart';
import '../screens/reset_password_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

//this is for login
  final loginPasswordController = TextEditingController();
  final loginEmailController = TextEditingController();
  //this is for otp
  final otpEmailController = TextEditingController();
  final otpController = TextEditingController();
  //this is for reset password
  final resetPassController = TextEditingController();
  final resetPassConfirmController = TextEditingController();
  //this is for sign up
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerConfPassController = TextEditingController();

  bool passObscure = true;
  bool passConfObscure = true;
  String ? errorMsg;
  final auth = FirebaseAuth.instance;
  final firebaseFireStore = FirebaseFirestore.instance;
  void changeVisible(){
    emit(LoadingState());
    passObscure = !passObscure;
    emit(AuthInitial());
  }
  void changeConfVisible(){
    emit(LoadingState());
    passConfObscure = !passConfObscure;
    emit(AuthInitial());
  }

  void login()async{
    emit(LoadingState());
    await auth.signInWithEmailAndPassword(
      email:loginEmailController.text ,
      password: loginPasswordController.text,
    ).then((value) async{
      navigateTo(HomeScreen(),removeAll: true);
      showToast(msg: "You logged as ${value.user?.email}",
          backgroundColor: AppColors.mainColor, textColor: Colors.white);
      }).catchError((onError){
        showToast(msg: "check your email and password are correct",);
    });
    emit(AuthInitial());
  }

  void register()async{
    emit(LoadingState());
    await auth.createUserWithEmailAndPassword(
      email:registerEmailController.text ,
      password: registerPassController.text,
    ).then((value)async{
       navigateTo(const HomeScreen(),removeAll: true);
      showToast(msg: "You logged as ${value.user?.email}",
          backgroundColor: AppColors.mainColor, textColor: Colors.white);
      await firebaseFireStore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(
          {
            "name":registerNameController.text,
            "password":registerPassController.text,
            "email":registerEmailController.text,
            "phone":registerPhoneController.text,
            "id":FirebaseAuth.instance.currentUser!.uid,
          },
      );
    });
    emit(AuthInitial());
  }

  void sendOtp()async{
    emit(LoadingState());
    await auth.sendPasswordResetEmail(
      email:otpEmailController.text ,
    ).then((value)async{
      showToast(msg: "check your email for code",);
    }).catchError(  (onError){
      showToast(msg: "check your email is correct",);
    });
    emit(AuthInitial());
  }

  void storeData()async{
    emit(LoadingState());
    await firebaseFireStore.collection("docs").doc().set(
        {
          "name":"دكتور سامح فرج ",
          "dept":"""استشارى وخبير المناظير المتقدمة استشاري اول الجراحه العامه و جراحه المناظير و جراحه الأورام زميل كليه الجراحين الملكيه _ لندن زمالة جراحه السمنه مستشفى هومرتون _ لندن زمالة الجراحه العامه و اورام القاولون مستشفى ورذينج استشارى جراحات الجهاز الهضمى _ المستشفى الجامعى _ برايتون عضو الفيدرالية الدولية لجراحات السمنة""",
          "location":"العنوان طنطا البرج الزجاجى أمام المحطة",
          "price":"250 Egp",
          "lat":"30.784451",
          "long":"30.997881",
          "catId":"9",
        }).then((value) {
          print("Success");
          emit(AuthInitial());
    });
    emit(AuthInitial());
  }



}
