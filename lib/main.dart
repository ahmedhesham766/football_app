import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/layout/football_layout.dart';
import 'package:football_app/moduels/screentest/SoccerAppScreen.dart';
import 'package:football_app/shared/constant/constant.dart';
import 'package:football_app/shared/network/dio_observer.dart';
import 'package:football_app/shared/network/remote/dio_helper.dart';
import 'package:football_app/shared/style/theme.dart';
import 'package:intl/intl.dart';


void main() {
  DioHelper.init();
  const oneMin = Duration(seconds:60);
  Timer.periodic(oneMin, (Timer t) => FootballCubit().getHomeData(leagueId: 2));
  BlocOverrides.runZoned(
        () {
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballCubit(),
      child: BlocConsumer<FootballCubit,FootballStates>(
        listener:(context, state) {}  ,
        builder: (context, state) {
          print(DateFormat("yyyy-MM-dd").format(DateTime.now())) ;
          print(idOfLeagues[FootballCubit.get(context).currentIndex]);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightmode,
            home: FootballLayout(),
          ) ;
        } ,

      ),
    );
  }
}

