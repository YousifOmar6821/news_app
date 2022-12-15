
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_abdullah_mansour/shared/cubit/states.dart';
import 'package:udemy_abdullah_mansour/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  int currentIndex = 0;

  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark=false;
  void changMode({bool fromShared}){
    if(fromShared!=null)
    {
    isDark = fromShared;
    emit(ChangeThemeMode());
    }
    else
    {
      isDark = !isDark;
    CacheHelper.putBool(key: 'isDark',value:isDark).then((value) {
      emit(ChangeThemeMode());
    });
    }
  }
}
