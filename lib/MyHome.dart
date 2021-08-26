import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppCubit()..getSportData()
      ..getHealthData()
      ..getBusinessData()
      ,
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, appState) {},
          builder: (context, appState) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                centerTitle: true,
              ),
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  unselectedLabelStyle:
                  TextStyle(fontSize: 15, color: Color(0xcff576158)),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedItemColor: Color(0xcff576158),
                  selectedItemColor: Colors.blue,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },

                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sports),
                        label: 'Sport'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.business),
                        label: 'business'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.local_hospital), label: 'hospital'),

                  ]),

            );
          }


      ),

    );
  }}
