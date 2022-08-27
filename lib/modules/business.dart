import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/componenets.dart';

class business extends StatelessWidget {
  business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewsState>(
      listener:(context , state){} ,
      builder: (context , state) {
        var list = Newscubit.get(context).businessList;
        return articleBuilder(list,context);
      }
    );
  }

}
