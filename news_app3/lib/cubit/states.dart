abstract class NewsStates{}

class NewInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

//-----------------------for business ----------///
class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error ;

  NewsGetBusinessErrorState(this.error);

}

//-----------*------------for business -----------*----------///


//-----------------------for sports ----------///
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error ;

  NewsGetSportsErrorState(this.error);

}
//-----------*------------for Sports -----------*----------///



//-----------------------for Science ----------///
class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error ;

  NewsGetScienceErrorState(this.error);

}
//-----------*------------for Science -----------*----------///



//-----------------------for Search ----------///
class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error ;

  NewsGetSearchErrorState(this.error);

}
//-----------*------------for Search -----------*----------///

