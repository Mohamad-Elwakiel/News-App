// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
//import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return articleBuilder(list);
      },
    );
  }
}
