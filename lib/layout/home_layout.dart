// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';

  class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold (
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.search
                    )),
                IconButton(
                    onPressed: (){
                      ThemeCubit.get(context).changeAppTheme();
                    },
                    icon: Icon(
                        Icons.dark_mode
                    )),

              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);

              },

              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],

          );
        },
      ),
    );
  }
}
