import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/cubit.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/states.dart';
import 'package:udemy_abdullah_mansour/shared/components/components.dart';
import 'package:udemy_abdullah_mansour/shared/cubit/cubit.dart';

import 'search.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (BuildContext context ,state){},
    builder: (BuildContext context ,state){
      var cubit=NewsCubit.get(context)  ;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                 navigateTo(context, SearchScreen(),);
                },
                icon:Icon(Icons.search),
            ),
            IconButton(
              onPressed: (){
                AppCubit.get(context).changMode();
              }, icon:Icon(Icons.brightness_4_outlined),

            ),
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: cubit.bottomItems,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changBottomNavBatState(index);
          },
        ),
      );
    },
    );
  }
}
