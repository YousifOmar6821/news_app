abstract class NewsStates {}
class NewsInitStates extends NewsStates {}
class NewsBottomNavState extends NewsStates{}
//Business States
class NewsGetBusinessLoadingState extends NewsStates {}
class NewsGetBusinessSuccessState extends NewsStates {}
class NewsGetBusinessFailedState extends NewsStates {
  final String error;
  NewsGetBusinessFailedState(this.error);
}
//Sports States
class NewsGetSportsLoadingState extends NewsStates {}
class NewsGetSportsSuccessState extends NewsStates {}
class NewsGetSportsFailedState extends NewsStates {
  final String error;
  NewsGetSportsFailedState(this.error);
}
//Science States
class NewsGetScienceLoadingState extends NewsStates {}
class NewsGetScienceSuccessState extends NewsStates {}
class NewsGetScienceFailedState extends NewsStates {
  final String error;
  NewsGetScienceFailedState(this.error);
}

class ChangeThemeMode extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates {}
class NewsGetSearchSuccessState extends NewsStates {}
class NewsGetSearchFailedState extends NewsStates {
  final String error;
  NewsGetSearchFailedState(this.error);
}