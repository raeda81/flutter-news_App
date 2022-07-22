import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/componantes.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../cubit_light_dark/cubit.dart';
import '../modules/search/search.dart';
// import 'package:news_app/components/componantes.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/cubit/states.dart';
// import 'package:news_app/cubit_light_dark/cubit.dart';
// import 'package:news_app/modules/search/search.dart';
// import 'package:news_app/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return // we can get all data at one time while we build the application and remove if chart that we have added in the cubit
       BlocConsumer<NewsCubit , NewsStates>(
        listener: (BuildContext context, NewsStates state) {  },
        builder: (BuildContext context,NewsStates state) {
          var cubit = NewsCubit.get(context) ;
          return Scaffold(

          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo( context, SearchScreen()) ;
                },
                icon: Icon(Icons.search),
            ),
              IconButton(
                onPressed: (){
                  AppModeCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
            body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30.0,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items:  cubit.bottomItems ,
          ),
        );
          },


      );

  }
}
