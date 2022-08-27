import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/search/search/search_screen.dart';
import 'package:news/shared/bloc.dart';
import 'package:news/shared/components/componenets.dart';








class news extends StatelessWidget {
  const news({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , NewsState>(
      listener: (context ,state){},
      builder: (context ,state)
      {
        var cubit = Newscubit.get(context);

       return Scaffold(
         appBar: AppBar(
           title: Text(
             'News App',
           ),
           actions: [
             IconButton(
               icon: Icon(
                 Icons.search,
               ),
               onPressed: ()
               {
                 navigateTo(context,SearchScreen());

               },
             ),
             IconButton(
               icon: Icon(
                 Icons.brightness_4_outlined,
               ),
               onPressed: ()
               {
                 AppCubit.get(context).changeAppMode();
               },
             ),
           ],
         ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);

            },
            items: cubit.bottomItems,
          ),

        );
      },



    );
  }
}
