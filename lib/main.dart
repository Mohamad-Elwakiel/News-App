// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/Bloc_observer.dart';
import 'layout/home_layout.dart';

void main() {
  BlocOverrides.runZoned(()
      {
        runApp(MyApp());

        DioHelper.init();


      },
  blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.red,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                titleSpacing: 20,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,

                ),

              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.redAccent,
                elevation: 10,
              ),



            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.red,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backgroundColor: HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
                iconTheme: IconThemeData(
                    color: Colors.white
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarBrightness: Brightness.light,

                ),

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.redAccent,
                unselectedItemColor: Colors.grey,
                elevation: 10,
                backgroundColor: HexColor('333739'),
              ),

            ),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(),
          );
          },

      ),
    );
  }
}


