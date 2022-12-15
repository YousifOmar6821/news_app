
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/cubit.dart';
import 'package:udemy_abdullah_mansour/modules/newsApp/cubit/states.dart';
import 'package:udemy_abdullah_mansour/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
 final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: TextFormField(
                      //   controller: searchController,
                      //   keyboardType: TextInputType.text,
                      //   onChanged: (String value) {
                      //       NewsCubit.get(context).getSearch(value);
                      //   },
                      //   validator:(String value) {
                      //     if (value.isEmpty) {
                      //       return 'Search must be not empty';
                      //     } else
                      //       return null;
                      //   },
                      //   style: TextStyle(color: Colors.deepOrange),
                      // ),
                    child: defaultTextFormField(
                        text: 'Search',
                        prefix: Icons.search,
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Search must be not empty';
                          } else
                            return null;
                        },
                      onChange: (String value) {
                          if (value!=null){
                            NewsCubit.get(context).getSearch(value);
                          } else return null;
                        }),
                  ),
                ),
              ),
              ),
             Expanded(child: articleBuilder(list, context,isFallback: true)),
            ],
          ),
        );
      },
    );
  }
}
