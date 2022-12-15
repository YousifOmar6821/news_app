import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_abdullah_mansour/shared/Bloc_Observer.dart';
import 'package:udemy_abdullah_mansour/shared/cubit/cubit.dart';
import 'package:udemy_abdullah_mansour/shared/cubit/states.dart';
import 'package:udemy_abdullah_mansour/shared/network/local/cache_helper.dart';
import 'package:udemy_abdullah_mansour/shared/network/remote/dio_helper.dart';
import 'package:udemy_abdullah_mansour/shared/styles/themes.dart';
import 'modules/newsApp/cubit/cubit.dart';
import 'modules/newsApp/newsHome.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getBool(key:'isDark');
  runApp(MyApp(isDark));
}
//Class MyApp
class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusinessData()..getSportsData()..getScienceData()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changMode(fromShared:isDark),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
