abstract class NewsStates {}

abstract class ThemeStates {}

class InitialState extends NewsStates {}

class NewsBottomNav extends NewsStates {}

class GetBusinessNewsLoadingState extends NewsStates {}

class GetBusinessNewsSuccessState extends NewsStates {}

class GetBusinessNewsFailState extends NewsStates {
  final String error;

  GetBusinessNewsFailState(this.error);
}

class GetSportsNewsLoadingState extends NewsStates {}

class GetSportsNewsSuccessState extends NewsStates {}

class GetSportsNewsFailState extends NewsStates {

  final String error;

  GetSportsNewsFailState(this.error);
}

class GetScienceNewsLoadingState extends NewsStates {}

class GetScienceNewsSuccessState extends NewsStates {}

class GetScienceNewsFailState extends NewsStates {

  final String error;

  GetScienceNewsFailState(this.error);
}

class ChangeAppTheme extends ThemeStates {}

class InitialThemeState extends ThemeStates {}
