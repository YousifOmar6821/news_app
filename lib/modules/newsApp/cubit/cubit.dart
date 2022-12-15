// import 'package:bloc/bloc.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/business.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/states.dart';
import 'package:udemy_abdullah_mansour/shared/network/remote/dio_helper.dart';

import '../science.dart';
//import '../settings.dart';
import '../sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super (NewsInitStates());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
      label: 'Business'
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
  ];
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changBottomNavBatState( int index){
    currentIndex=index;
    emit(NewsBottomNavState());
  }
  //Get the Business Data
  List<dynamic>business=[];
  void getBusinessData(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'f799c15085314e7f98b4fc8853af2376'
        },
    ).then((value) {
     // print(value.data['articles'][1]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailedState(error.toString()));
    });
  }
  //Get the Sports Data
  List<dynamic>sports=[];
  void getSportsData(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apikey':'f799c15085314e7f98b4fc8853af2376'
      },
    ).then((value) {
      // print(value.data['articles'][1]['title']);
      sports=value.data['articles'];
      //print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsFailedState(error.toString()));
    });
  }
//Get the Sports Data
  List<dynamic>science=[];
  void getScienceData(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apikey':'f799c15085314e7f98b4fc8853af2376'
      },
    ).then((value) {
      // print(value.data['articles'][1]['title']);
      science=value.data['articles'];
     // print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceFailedState(error.toString()));
    });
  }
  bool isDark=false;
  void changMode(){
    isDark = !isDark;
    emit(ChangeThemeMode());
  }

  List<dynamic>search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
      'q':'$value',
        'apikey':'f799c15085314e7f98b4fc8853af2376'
      },
    ).then((value)
    {
       print(value.data['articles'][1]['title']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchFailedState(error.toString()));
    });
  }
}