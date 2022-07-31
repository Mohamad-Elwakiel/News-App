// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.black26,
                  child: defaultFormField(
                    controller: searchController,
                    inputType: TextInputType.text,
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    text: 'Search',
                    prefixIcon: Icons.search,
                    onChange: (value)
                    {
                      NewsCubit.get(context).getSearchedForNews(value!);
                    },
                  ),
                ),
              ),
              Expanded(child: articleBuilder(list)),
            ],
          ),
        );
      },

    );
  }
}
