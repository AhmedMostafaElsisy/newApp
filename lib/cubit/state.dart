abstract class AppState {}

class AppInitialState extends AppState {}

class BottomNavState extends AppState {}

class LoadingDataState extends AppState {}

class GetDataState extends AppState {}

class ErrorDataState extends AppState {
  final String error;

  ErrorDataState(this.error);
}



class LoadingHealthDataState extends AppState {}

class GetHealthDataState extends AppState {}

class ErrorHealthDataState extends AppState {
  final String error;

  ErrorHealthDataState(this.error);
}


class LoadingBusinessDataState extends AppState {}

class GetBusinessDataState extends AppState {}

class ErrorBusinessDataState extends AppState {
  final String error;

  ErrorBusinessDataState(this.error);
}

