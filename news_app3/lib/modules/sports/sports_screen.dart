import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/componantes.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
// import 'package:news_app/components/componantes.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/cubit/states.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).sports;
          return articleBuilder(list ,context);
        });
  }
}
