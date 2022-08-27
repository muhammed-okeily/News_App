
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';

import 'package:news/modules/business.dart';
import 'package:news/modules/science.dart';

import 'package:news/modules/sports.dart';
import 'package:news/shared/network/local/cash_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';


class Newscubit extends Cubit<NewsState>
{
Newscubit(): super(NewsInitialState());
static Newscubit get(context) =>BlocProvider.of(context);
int currentIndex =  0;
List<BottomNavigationBarItem> bottomItems =
[
  BottomNavigationBarItem(
    icon: Icon(
     Icons.work,
    ),
    label: 'Business'
  ),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports'
  ),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.science_sharp,
      ),
      label: 'Science'
  ),


];
List<Widget> screens =
    [
      business(),

      science(),
      sports(),



    ];
void changeBottomNavBar(int index)
{
  currentIndex = index ;
  if (index == 1)
    getSports();
  if (index == 2)
    getScience();
  emit(NewsBottomState());
}
List<dynamic> businessList  = [];
void getBusiness()
{
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headlines',
    query: {
      'country':'eg',
      'apiKey':'b366b06b80544ba194bd93606f71d71e',
    },
  ).then((value){

    businessList = value.data['articles'];
    print(businessList[0]['title']);
    emit(NewsGetBusinessSucState());


  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));

  });
}

// ignore: non_constant_identifier_names
List<dynamic> SportsList  = [];
void getSports()
{
  emit(NewsGetSportsLoadingState());
  if(SportsList.length==0)
    {
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'b366b06b80544ba194bd93606f71d71e',
        },
      ).then((value){

        SportsList = value.data['articles'];
        print(SportsList[0]['title']);
        emit(NewsGetSportsSucState());


      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));

      });

    }else{
    emit(NewsGetSportsSucState());
  }

}

List<dynamic> ScienceList  = [];
void getScience() {
  emit(NewsGetScienceLoadingState());
  if (ScienceList.length == 0) {
    DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'b366b06b80544ba194bd93606f71d71e',
      },
    ).then((value) {
      ScienceList = value.data['articles'];
      print(ScienceList[0]['title']);
      emit(NewsGetScienceSucState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  } else {
    emit(NewsGetScienceSucState());
  }
}

  List<dynamic> search  = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());


    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'b366b06b80544ba194bd93606f71d71e',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSucState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    }

    );
  }
}