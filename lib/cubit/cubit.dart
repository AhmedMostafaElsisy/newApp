import 'package:aly_task/Screen/BusinessScreen.dart';
import 'package:aly_task/Screen/ScienceScreen.dart';
import 'package:aly_task/Screen/SportScreen.dart';
import 'package:aly_task/cubit/state.dart';
import 'package:aly_task/network/remote/Dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
    SportScreen(),
    ScienceScreen(),
    BusinessScreen(),

  ];
  List<String> screenName = [
    'BusinessScreen',
    'SportScreen',
    'ScinceScreen',
  ];

  List<dynamic> data=[];
  List<dynamic> healthData=[];
  List<dynamic> businessData=[];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  void getSportData(){
    emit(LoadingDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '2ced6bf5a6044e8dbcd3267a043752f0'
    }).then((value) {
      print(value.data['articles']);
      data=value.data['articles'];
      print(data[0]['title']);
      emit(GetDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDataState(error.toString()));
    });
  }
  void getHealthData(){
    emit(LoadingHealthDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '2ced6bf5a6044e8dbcd3267a043752f0'
    }).then((value) {
      print(value.data['articles']);
      healthData=value.data['articles'];
      print(healthData[0]['title']);
      emit(GetHealthDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHealthDataState(error.toString()));
    });
  }void getBusinessData(){
    emit(LoadingBusinessDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '2ced6bf5a6044e8dbcd3267a043752f0'
    }).then((value) {
      print(value.data['articles']);
      businessData=value.data['articles'];
      print(businessData[0]['title']);
      emit(GetBusinessDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorBusinessDataState(error.toString()));
    });
  }
}
