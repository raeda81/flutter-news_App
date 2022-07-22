import 'package:flutter/material.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/layout/news_app.dart';
// import 'package:news_app/lib/style/bloc_observer.dart';
// import 'package:news_app/network/remote/dio_helper.dart';
// import 'package:news_app/style/bloc_observer.dart';
import 'dart:ui' as ui;
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app3/style/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'cubit_light_dark/cubit.dart';
import 'cubit_light_dark/states.dart';
import 'layout/news_app.dart';
import 'network/remote/dio_helper.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized() ;
  BlocOverrides.runZoned(
    ()  {
      runApp(MyApp());
      DioHelper.init(); // we did call the dio helper.init() here while creating the application so its impossible to be null
      // but inside helper.init() we have "dio"  which is an object from Dio so First 1- the object is created and done
      // Then 2- init is called to do its function
      // Use cubits...


    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final bool isDark ;
  // MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>AppModeCubit()..changeAppMode()),
        BlocProvider(create:(BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience()),

      ],
      child: BlocConsumer<AppModeCubit,LightDarkStates>
        (
        listener: ( context, state) {  },
        builder: (context,  state) {

          return MaterialApp(
            home: NewsLayout(),

            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              // primarySwatch: Colors.deepOrange, // this will change the primary Color for all buttons So we will not use it to avoid anything could be happened to other buttons
              floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),

              //-------------------------appBarTheme-----------------//
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                // its a bool take true ot false and its default is true and if we make it false it will enable us to edit the status bar of the mobile itself
                // this is the app bar of the mobile itself (its called status bar) and we can use it in the theme
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(color: Colors.black),

              ),
              //--------------*-----------appBarTheme--------*---------//

              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,


                // backgroundColor: Colors.white
              ),

              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600 ,
                  color: Colors.black ,
                ),
              ),

            ), //for light mode


            darkTheme: ThemeData(// for dark mode
              scaffoldBackgroundColor: HexColor('#333739'),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              //-------------------------appBarTheme-----------------//
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('#333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                color:HexColor('#333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              //--------------*-----------appBarTheme--------*---------//
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('#333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600 ,
                    color: Colors.white
                ),
              ),




            ),

            themeMode: AppModeCubit.get(context).isDark ?  ThemeMode.dark :  ThemeMode.light ,
          );
        },

      ),
    ) ;
  }
}
