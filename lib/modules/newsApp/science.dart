//import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/cubit.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/states.dart';

import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).science;
        return articleBuilder(list,context);
      },
    );
  }
}
