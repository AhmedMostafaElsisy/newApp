import 'package:flutter/material.dart';
import 'package:aly_task/cubit/cubit.dart';
import 'package:aly_task/cubit/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../Shared.dart';
class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  _SportScreenState createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, appState) {},
        builder: (context, appState) {
          AppCubit cubit = AppCubit.get(context);
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
            appState is! LoadingDataState,
            widgetBuilder: (BuildContext context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>articalItem(cubit.data[index]),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                itemCount: cubit.data.length),
            fallbackBuilder: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          );
        });
  }
}
