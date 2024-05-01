import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../home_feature/presentation/screens/home2_screen.dart';
import '../../../home_feature/presentation/screens/home_screen.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationStats> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  static BottomNavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens =const  [
    HomeScreen(),
    Home2Screen(),
  ];
  void changeCurrent(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }
}
