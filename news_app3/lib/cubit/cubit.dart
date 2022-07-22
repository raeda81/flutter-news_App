
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app3/cubit/states.dart';
import '../modules/business/business_screen.dart';
import '../modules/science/science_screen.dart';
import '../modules/sports/sports_screen.dart';
import '../network/remote/dio_helper.dart';
// import 'package:news_app/cubit/states.dart';
// import 'package:news_app/lib/cubit/states.dart';
// import 'package:news_app/modules/business/business_screen.dart';
// import 'package:news_app/modules/science/science_screen.dart';
// import 'package:news_app/modules/settings/settings_screen.dart';
// import 'package:news_app/modules/sports/sports_screen.dart';
// import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
   int currentIndex = 0 ;

   // ----------------------- BottomNavigationBar ------------------ //
   List <BottomNavigationBarItem> bottomItems =[
     BottomNavigationBarItem(
       icon: Icon(Icons.business),
       label: 'business'
     ) ,
     BottomNavigationBarItem(
         icon: Icon(Icons.sports),
         label: 'sports'
     ) ,
     BottomNavigationBarItem(
         icon: Icon(Icons.science),
         label: 'science'
     ) ,

   ] ;



  void changeBottomNavBar(int index)
  {
    currentIndex = index ;
    emit(NewsBottomNavState());

    if(index == 1 ){
      getSports();
    }else if (index ==2){
      getScience() ;
    }
  }


// ---------------*-------- BottomNavigationBar ----------*-------- //

List <Widget> screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen() ,
];


//---------------------for business ------------------///
  List  <dynamic> business =[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url:'v2/top-headlines' ,
      query: {
        "country":"eg" ,
        "category":"business" ,
        "apikey":"e6f9c50e48cb458db67905d62401d00b" ,}, //take care you have to pay attention that this KEY is always changing and we can get the new key from the website

    ).then( (value) {
      // print(value.data['articles'][0]['title']);
      business =value.data['articles'] ;
      // print(business[0]['publishedAt']);
      emit(NewsGetBusinessSuccessState());
    }
    ).catchError(  (error) {
      print(error.toString());
      emit( NewsGetBusinessErrorState(  error.toString()  ) );
    } ) ;

  }
//-----------*------------for business -----------*----------///


//---------------------for sports ------------------///
  List  <dynamic> sports =[];

  void getSports(){
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0 ){      // we did use this if chart just to get the data only one time and don't reload it every time we press on the button


      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          "country":"eg" ,
          "category":"Sports" ,
          "apikey":"e6f9c50e48cb458db67905d62401d00b" ,}, //take care you have to pay attention that this KEY is always changing and we can get the new key from the website

      ).then( (value) {
        // print(value.data['articles'][0]['title']);
        sports =value.data['articles'] ;
        // print(sports[0]['publishedAt']);
        emit(NewsGetSportsSuccessState());
      }
      ).catchError(  (error) {
        print(error.toString());
        emit( NewsGetSportsErrorState(  error.toString()  ) );
      } ) ;

    }else{
      emit(NewsGetSportsSuccessState());
    }


  }
//-----------*------------for sports -----------*----------///

//---------------------for science ------------------///
  List  <dynamic> science =[];

  void getScience(){
    emit(NewsGetScienceLoadingState());

    if(science.length==0 ){

      DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          "country":"eg" ,
          "category":"Science" ,
          "apikey":"e6f9c50e48cb458db67905d62401d00b" ,}, //take care you have to pay attention that this KEY is always changing and we can get the new key from the website

      ).then( (value) {
        // print(value.data['articles'][0]['title']);
        science =value.data['articles'] ;
        // print(science[0]['publishedAt']);
        emit(NewsGetScienceSuccessState());
      }
      ).catchError(  (error) {
        print(error.toString());
        emit( NewsGetScienceErrorState(  error.toString()  ) );
      } ) ;
    }else{
      emit(NewsGetScienceSuccessState());
    }



  }
//-----------*------------for science -----------*----------///



//---------------------for search ------------------///-
  List  <dynamic> search =[];

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    // search =[] ;
    DioHelper.getData(
      url:'v2/everything' ,
      query: {
        "q":"$value" ,
        "from":"2022-07-19",
        "to":"2022-07-19",
        "sortBy":"popularity",
        "apikey":"e6f9c50e48cb458db67905d62401d00b" ,
      }, //take care you have to pay attention that this KEY is always changing and we can get the new key from the website

    ).then( (value) {
      // print(value.data['search'][0]['title']);
      search =value.data['articles'] ;
      // print(science[0]['publishedAt']);
      emit(NewsGetSearchSuccessState());
    }
    ).catchError(  (error) {
      print(error.toString());
      emit( NewsGetSearchErrorState(  error.toString()  ) );



  }) ;}
//-----------*------------for science -----------*----------///

}