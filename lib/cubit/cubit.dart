// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/Science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';

import '../modules/Business/Business_Screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball_outlined),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),


  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 1) {
      getSportsNews();
    }
    if(index == 2){
      getScienceNews();
    }
    emit(NewsBottomNav());
  }

  List <Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  List<dynamic> business = [];

  void getBusinessNews() {
    emit(GetBusinessNewsLoadingState());
    if(business.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'eg',
            'category': 'business',
            'apiKey' : 'b81c9c953a9f4c5583fa129a2f883399',
          }
      ).then((value) {
        business = value?.data['articles'];
        print(business[0]['title']);
        emit(GetBusinessNewsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetBusinessNewsFailState(error.toString()));
      });
    }
    else{
      emit(GetBusinessNewsSuccessState());
    }

  }

  List <dynamic> sports = [];

  void getSportsNews () {

    emit(GetSportsNewsLoadingState());
    if(sports.isEmpty){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'eg',
            'category': 'sport',
            'apiKey' : 'b81c9c953a9f4c5583fa129a2f883399',
          }
      ).then((value) {
        sports = value?.data['articles'];
        emit(GetSportsNewsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetSportsNewsFailState(error.toString()));
      });
    }
    else {
      emit(GetSportsNewsSuccessState());
    }


  }

  List <dynamic> science = [];

  void getScienceNews (){
    emit(GetScienceNewsLoadingState());
    if(science.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country' : 'eg',
            'category': 'science',
            'apiKey' : 'b81c9c953a9f4c5583fa129a2f883399',
          }
      ).then((value) {
        science = value?.data['articles'];
        emit(GetScienceNewsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetScienceNewsFailState(error.toString()));
      });
    }
    else{
      emit(GetScienceNewsSuccessState());
    }

  }



}

class ThemeCubit extends Cubit <ThemeStates>
{

  ThemeCubit() : super(InitialThemeState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void  changeAppTheme ({bool? theme}){
    if(theme != null) {
      isDark = theme;
    }
    else {
      isDark = !isDark;
    }
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) =>
          emit(ChangeAppTheme()));

    
  }

}
