import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/componantes.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
// import 'package:news_app/components/componantes.dart';
// import 'package:news_app/cubit/cubit.dart';
// import 'package:news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    isPassword: false,
                    onChanged: (value) {
                      // NewsCubit.get(context).getSearch(value);
                      NewsCubit.get(context).getSearch(value);
                    },
                    controller: searchController,
                    prefixIcon: Icons.search,
                    type: TextInputType.text,
                    labelText: 'Search',
                    validatorText: 'Search field  cant be empty'),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}
