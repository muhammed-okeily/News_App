abstract class NewsState{}
class NewsInitialState extends NewsState {}
class NewsBottomState extends NewsState {}
class NewsGetBusinessLoadingState extends NewsState {}
class NewsGetBusinessSucState extends NewsState {}
class NewsGetBusinessErrorState extends NewsState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsState {}
class NewsGetSportsSucState extends NewsState {}
class NewsGetSportsErrorState extends NewsState {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}
class NewsGetScienceSucState extends NewsState {}
class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}
class NewsGetSearchSucState extends NewsState {}
class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}



