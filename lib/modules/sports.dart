import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/componenets.dart';

class  science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewsState>(
        listener:(context , state){} ,
        builder: (context , state) {
          var list = Newscubit.get(context).SportsList;
          return articleBuilder(list,context);
        }
    );
  }
}
