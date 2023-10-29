import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/modules/categories_screen/categories_screen.dart';
import 'package:macidp/macidp/modules/fav_screen/fav_screen.dart';
import 'package:macidp/macidp/modules/products/products_screen.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false ;


  int currentIndex = 0 ;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    FavScreen(),
    FavScreen(),
    // SettingsScreen(),
    CategoriesScreen(),
  ];

  void changeBottom(int index){
    currentIndex = index ;
    emit(AppChangeScreenState());
  }

  loading(){
    emit(AppLoadingState());
  }



}