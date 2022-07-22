// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app3/cubit_light_dark/states.dart';
// import 'package:news_app/lib/cubit_light_dark/states.dart';
// import 'package:news_app/cubit_light_dark/states.dart';


class AppModeCubit extends Cubit<LightDarkStates>{
  AppModeCubit() : super(InitialState());
  static AppModeCubit get(context) => BlocProvider.of(context);


  bool isDark = true;
  ThemeMode appMode = ThemeMode.dark ;

  void changeAppMode(){
      isDark = ! isDark ;

      emit(AppChangeModeState());



  }


}